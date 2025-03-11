import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_saviors/utils/constant.dart';

import 'live_tacking_controller.dart';

class BarDetailsScreen extends StatefulWidget {
  final String barName;
  final LatLng barLocation;
  final String barAddress;

  final barlat;
  final barlng;

  BarDetailsScreen({required this.barName, required this.barLocation, required this.barAddress, this.barlat, this.barlng});

  @override
  State<BarDetailsScreen> createState() => _BarDetailsScreenState();
}

class _BarDetailsScreenState extends State<BarDetailsScreen> {
  final mapController = Get.put(TrackingMapController());

  @override
  void initState() {
    socketController.userlat = double.parse(widget.barlat);
    socketController.userlng = double.parse(widget.barlng);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Store Location")),
      body: Obx(() => GoogleMap(
            initialCameraPosition: CameraPosition(
              target: widget.barLocation,
              zoom: 15.0,
            ),
            onMapCreated: mapController.onMapCreated,
            polylines: mapController.polylines.value,
            markers: {
              if (socketController.userlat != null) Marker(markerId: MarkerId('myLocation'), position: LatLng(widget.barlat, widget.barlng)),
              if (socketController.otherUserLocation.value != null)
                Marker(markerId: MarkerId('otherUser'), position: socketController.otherUserLocation.value!),
            },
            myLocationEnabled: true,
            mapType: MapType.normal,
          )),
    );
  }
}
