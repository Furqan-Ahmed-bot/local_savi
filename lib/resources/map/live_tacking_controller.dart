import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class TrackingMapController extends GetxController {
  Rx<GoogleMapController?> mapController = Rx<GoogleMapController?>(null);
  RxSet<Polyline> polylines = <Polyline>{}.obs;
  RxList<LatLng> trackingRoute = <LatLng>[].obs;

  late IO.Socket socket;

  @override
  void onInit() {
    super.onInit();
    connectToSocket();
  }

  void connectToSocket() {
    socket = IO.io('https://your-socket-server.com', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    socket.onConnect((_) {
      log("Connected to Socket Server");
      getTrackingData("cfddec10-a1cd-4812-8792-52da328e9b24"); // Pass actual jobId
    });

    socket.onDisconnect((_) => log("Disconnected from Socket"));
  }

  void getTrackingData(String jobId) {
    socket.on('track_now_cfddec10-a1cd-4812-8792-52da328e9b24', (data) {
      try {
        double lat = double.parse(data['latitude'].toString());
        double lng = double.parse(data['longitude'].toString());
        LatLng newLocation = LatLng(lat, lng);

        trackingRoute.add(newLocation);
        updatePolyline();
        moveCameraToLocation(newLocation);
      } catch (e) {
        log("Error in getTrackingData: $e");
      }
    });
  }

  void updatePolyline() {
    polylines.clear();
    polylines.add(
      Polyline(
        polylineId: const PolylineId("tracking_route"),
        points: trackingRoute,
        color: Colors.blue,
        width: 5,
      ),
    );
  }

  void moveCameraToLocation(LatLng location) {
    mapController.value?.animateCamera(CameraUpdate.newLatLng(location));
  }

  void onMapCreated(GoogleMapController controller) {
    mapController.value = controller;
  }

  @override
  void onClose() {
    socket.dispose();
    super.onClose();
  }
}
