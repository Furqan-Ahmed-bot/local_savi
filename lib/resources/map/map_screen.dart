import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_controller.dart';

class MapScreen extends StatelessWidget {
  final LatLng? initialLocation;
  const MapScreen({Key? key, this.initialLocation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapController mapController = Get.put(MapController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              if (mapController.selectedLocation.value != null) {
                Get.back(result: mapController.selectedLocation.value);
              } else {
                // Handle the case when no location is selected
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Obx(() => GoogleMap(
                onMapCreated: (controller) {
                  mapController.mapController.complete(controller);
                },
                trafficEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: initialLocation ?? LatLng(0.0, 0.0),
                  zoom: 5,
                ),
                onTap: (latLng) {
                  mapController.updateSelectedLocation(latLng);
                },
                markers: mapController.selectedLocation.value != null
                    ? Set<Marker>.from([
                        Marker(
                          markerId: MarkerId('selected_location'),
                          position: mapController.selectedLocation.value!,
                        ),
                      ])
                    : Set<Marker>(),
                circles: mapController.circles,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                zoomControlsEnabled: true,
              )),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: mapController.searchController,
                      decoration: InputDecoration(
                        hintText: 'Search for a location',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      mapController.searchLocation();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
