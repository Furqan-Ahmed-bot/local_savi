// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_saviors/utils/constant.dart';

import '../components/sockets/sockets.dart';
import 'live_tacking_controller.dart';

class BarDetailsScreen extends StatefulWidget {
  final String barName;
  final LatLng barLocation;
  final String barAddress;
  final jobId;

  final barlat;
  final barlng;

  BarDetailsScreen({required this.barName, required this.barLocation, required this.barAddress, this.jobId, this.barlat, this.barlng});

  @override
  State<BarDetailsScreen> createState() => _BarDetailsScreenState();
}

class _BarDetailsScreenState extends State<BarDetailsScreen> {
  final mapController = Get.put(TrackingMapController());

  @override
  void initState() {
    userlat = double.parse(widget.barlat.toString());
    userlng = double.parse(widget.barlng.toString());
    // socketController.startLocationUpdates(widget.jobId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Store Location")),
      body: Obx(() => GoogleMap(
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            initialCameraPosition: CameraPosition(
              target: widget.barLocation,
              zoom: 15.0,
            ),
            onMapCreated: socketController.onMapCreated,
            polylines: socketController.polylines,
            markers: {
              if (userlat != null) Marker(markerId: MarkerId('myLocation'), position: LatLng(widget.barlat, widget.barlng)),
              if (socketController.otherUserLocation.value != null)
                Marker(markerId: MarkerId('otherUser'), position: socketController.otherUserLocation.value!),
            },
            myLocationEnabled: true,
            mapType: MapType.normal,
          )),
    );
  }
}
