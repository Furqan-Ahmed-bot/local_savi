// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:async';
import 'dart:math';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:local_saviors/utils/constant.dart';

class DriverGoogleMapController extends GetxController {
  Rx<LatLng?> currentLocation = Rx<LatLng?>(null);
  Rx<Marker?> myMarker = Rx<Marker?>(null);
  Rx<GoogleMapController?> mapController = Rx<GoogleMapController?>(null);
  RxBool locationEnabled = false.obs;
  Rx<LocationPermission?> permissionStatus = Rx<LocationPermission?>(null);
  StreamSubscription<Position>? locationStream;

  // @override
  // void onInit() {
  //   super.onInit();
  //   checkLocationPermission();
  // }

  Future<void> focusMyLocation() async {
    if (mapController.value != null && currentLocation.value != null) {
      mapController.value!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: currentLocation.value!,
            zoom: 16.0,
          ),
        ),
      );
    }
  }

  Future<void> updateCurrentLocation(LatLng? location) async {
    if (location != null) {
      currentLocation.value = location;
      // updateDriverLocation(location);
      await loadMarkers();
    }
  }

  // void updateDriverLocation(Map<String, dynamic> locationData) {
  //   // Send location data via socket
  // }

  void setLocationStream(StreamSubscription<Position> stream) {
    locationStream?.cancel();
    locationStream = stream;
  }

  Future<void> checkLocationPermission(jobId) async {
    LocationPermission permission = await Geolocator.checkPermission();
    permissionStatus.value = permission;

    if (permission == LocationPermission.denied) {
      requestLocationPermission(jobId);
    } else if (permission != LocationPermission.deniedForever) {
      startLocationStream(jobId: jobId);
    }
  }

  Future<void> requestLocationPermission(jobId) async {
    LocationPermission permission = await Geolocator.requestPermission();
    permissionStatus.value = permission;
    if (permission != LocationPermission.denied && permission != LocationPermission.deniedForever) {
      locationEnabled.value = true;
      startLocationStream(jobId: jobId);
    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapController.value = controller;
  }

  Future<void> loadMarkers() async {
    if (currentLocation.value != null) {
      myMarker.value = Marker(
        markerId: MarkerId("driver_marker"),
        position: currentLocation.value!,
      );
    }
    focusMyLocation();
  }

//   void giveTrackingData(String jobId, double lat, double lng) {
//   socket?.emit("track_now", {'job_id': jobId, 'latitude': lat, 'longitude': lng});
// }

  double _calculateDistance(LatLng start, LatLng end) {
    const double R = 6371000; // Earth's radius in meters
    double dLat = _degreesToRadians(end.latitude - start.latitude);
    double dLon = _degreesToRadians(end.longitude - start.longitude);

    double a =
        sin(dLat / 2) * sin(dLat / 2) + cos(_degreesToRadians(start.latitude)) * cos(_degreesToRadians(end.latitude)) * sin(dLon / 2) * sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c; // Distance in meters
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  Future<void> startLocationStream({String? jobId}) async {
    if (locationEnabled.value) return;

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 5, // Geolocator will trigger updates every 5m
    );

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    LatLng lastSentLocation = LatLng(position.latitude, position.longitude);
    await updateCurrentLocation(lastSentLocation);

    setLocationStream(
      Geolocator.getPositionStream(locationSettings: locationSettings).listen(
        (Position? position) async {
          if (position != null) {
            LatLng newLocation = LatLng(position.latitude, position.longitude);
            double distanceMoved = _calculateDistance(lastSentLocation, newLocation);

            if (distanceMoved >= 50) {
              socketController.giveTrackingData(jobId, newLocation.latitude, newLocation.longitude);
              lastSentLocation = newLocation; // Update last sent location
            }
            socketController.giveTrackingData(jobId, newLocation.latitude, newLocation.longitude);

            await updateCurrentLocation(newLocation);
          }
        },
      ),
    );
  }

  @override
  void onClose() {
    locationStream?.cancel();
    super.onClose();
  }
}
