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
