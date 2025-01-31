import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  final Rx<LatLng?> selectedLocation = Rx<LatLng?>(null);
  final RxSet<Circle> circles = <Circle>{}.obs;
  final TextEditingController searchController = TextEditingController();
  final Completer<GoogleMapController> mapController = Completer();

  void updateSelectedLocation(LatLng location) {
    selectedLocation.value = location;
    updateCircles(location);
  }

  void searchLocation() async {
    String searchTerm = searchController.text;
    if (searchTerm.isEmpty) return;
    try {
      List<Location> locations = await locationFromAddress(searchTerm);
      if (locations.isNotEmpty) {
        Location firstLocation = locations.first;
        LatLng newLatLng = LatLng(firstLocation.latitude, firstLocation.longitude);
        final GoogleMapController? controller = await mapController.future;
        if (controller != null) {
          controller.animateCamera(CameraUpdate.newLatLngZoom(newLatLng, 12));
        }
        updateSelectedLocation(newLatLng);
      }
    } catch (e) {
      print('Error searching for location: $e');
    }
  }

  void updateCircles(LatLng location) {
    circles.clear();
    circles.addAll([
      Circle(
        circleId: CircleId('1_mile_radius'),
        center: location,
        radius: 1609.34, // 1 mile in meters
        fillColor: Color(0x220000FF),
        strokeWidth: 0,
      ),
      Circle(
        circleId: CircleId('2_miles_radius'),
        center: location,
        radius: 3218.69, // 2 miles in meters
        fillColor: Color(0x2200FF00),
        strokeWidth: 0,
      ),
      Circle(
        circleId: CircleId('3_miles_radius'),
        center: location,
        radius: 4828.03, // 3 miles in meters
        fillColor: Color(0x22FF0000),
        strokeWidth: 0,
      ),
    ]);
  }
}
