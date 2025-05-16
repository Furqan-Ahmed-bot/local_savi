// ignore_for_file: prefer_const_constructors, prefer_collection_literals, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_saviors/resources/extensions/context_extension.dart';
import 'package:google_places_flutter/google_places_flutter.dart';

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
                onMapCreated: mapController.onMapCreated,
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
          // Positioned(
          //   top: 10,
          //   left: 10,
          //   right: 10,
          //   child: Container(
          //     padding: EdgeInsets.symmetric(horizontal: 20),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //     child: Row(
          //       children: [
          //         Expanded(
          //           child: TextField(
          //             controller: mapController.searchController,
          //             decoration: InputDecoration(
          //               hintText: 'Search for a location',
          //               border: InputBorder.none,
          //             ),
          //           ),
          //         ),
          //         IconButton(
          //           icon: Icon(Icons.search),
          //           onPressed: () {
          //             mapController.searchLocation();
          //           },
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Positioned(
            top: 60.sp,
            left: 10.sp,
            right: 10.sp,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: GooglePlaceAutoCompleteTextField(
                itemBuilder: (context, index, prediction) => Container(
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                  color: Colors.white,
                  child: Text(
                    prediction.description.toString(),
                    style: context.titleMedium.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                isCrossBtnShown: false,
                seperatedBuilder: SizedBox(
                  height: 0.5.h,
                ),
                textEditingController: mapController.searchController,
                textStyle: context.titleMedium.copyWith(
                  color: Colors.black,
                ),
                containerHorizontalPadding: 10.sp,
                googleAPIKey: "AIzaSyBxr-E4rlPP7rUZPtM2SCFGEnBlEMDaTf8",
                inputDecoration: InputDecoration(
                  hintText: 'Search location',
                  hintStyle: context.titleMedium.copyWith(
                    color: context.onPrimary,
                  ),
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search,
                    color: context.onPrimary,
                  ),
                ),
                debounceTime: 800,
                isLatLngRequired: true,
                getPlaceDetailWithLatLng: (prediction) async {
                  final lat = double.tryParse(prediction.lat ?? "");
                  final lng = double.tryParse(prediction.lng ?? "");
                  if (lat != null && lng != null) {
                    LatLng newLatLng = LatLng(lat, lng);
                    if (lat != null && lng != null) {
                      LatLng newLatLng = LatLng(lat, lng);
                      await mapController.animateCameraToLocation(newLatLng);
                      mapController.setSelectedLocation(newLatLng, context);
                    }
                    mapController.selectedLocation.value = newLatLng;
                    mapController.updateCircles(mapController.selectedLocation.value!);
                  }
                },
                itemClick: (prediction) async {
                  mapController.searchController.text = prediction.description ?? "";
                  await Future.delayed(const Duration(milliseconds: 500));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
