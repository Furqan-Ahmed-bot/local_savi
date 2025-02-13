// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_collection_literals, unnecessary_string_interpolations

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowMapScreen extends StatefulWidget {
  final bool? isProfile;
  final LatLng? initialLocation;
  final address;
  const ShowMapScreen({super.key, this.initialLocation, this.isProfile, this.address});
  @override
  _ShowMapScreenState createState() => _ShowMapScreenState();
}

class _ShowMapScreenState extends State<ShowMapScreen> {
  LatLng? selectedLocation;
  Set<Circle> circles = {}; // Store circles for different radii
  TextEditingController searchController = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();

    // Initialize selectedLocation with the initialLocation provided
    selectedLocation = widget.initialLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        child: Center(child: Text('${widget.address}')),
      ),
      appBar: AppBar(
        title: Text(widget.isProfile == true ? 'Your Location' : 'Select Location'),
        actions: [
          widget.isProfile == true
              ? SizedBox.shrink()
              : IconButton(
                  icon: Icon(Icons.done),
                  onPressed: () {
                    if (selectedLocation != null) {
                      Navigator.pop(context, selectedLocation);
                    } else {
                      // Handle the case when no location is selected
                    }
                  },
                ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            onMapCreated: (controller) {
              print("Map created: $controller");
              _controller.complete(controller);
            },
            initialCameraPosition: CameraPosition(
              target: widget.initialLocation ?? LatLng(37.0902, -95.7129),
              zoom: 5,
            ),
            onTap: (latLng) {
              widget.isProfile == true
                  ? SizedBox.shrink()
                  : setState(() {
                      selectedLocation = latLng;
                      updateCircles(selectedLocation!);
                    });
            },
            markers: Set<Marker>.from([
              if (selectedLocation != null)
                Marker(
                  markerId: MarkerId('selected_location'),
                  position: selectedLocation!,
                ),
            ]),
            circles: circles,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
          ),
          widget.isProfile == true
              ? SizedBox.shrink()
              : Positioned(
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
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: 'Search for a location',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            searchLocation();
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

  void searchLocation() async {
    String searchTerm = searchController.text.trim();
    if (searchTerm.isEmpty) return;
    try {
      List<Location> locations = await locationFromAddress(searchTerm);
      if (locations.isNotEmpty) {
        Location firstLocation = locations.first;
        LatLng newLatLng = LatLng(firstLocation.latitude, firstLocation.longitude);
        // Move the camera to the new location
        final GoogleMapController? controller = await _controller.future;
        if (controller != null) {
          controller.animateCamera(CameraUpdate.newLatLngZoom(newLatLng, 12));
        }
        setState(() {
          selectedLocation = newLatLng;
          updateCircles(selectedLocation!);
        });
      }
    } catch (e) {
      print('Error searching for location: $e');
    }
  }

  // Method to update circles for different radii
  void updateCircles(LatLng location) {
    setState(() {
      // Clear existing circles
      circles.clear();
      // Add circles with different radii
      circles.add(
        Circle(
          circleId: CircleId('1_mile_radius'),
          center: location,
          radius: 1609.34, // 1 mile in meters
          fillColor: Color(0x220000FF), // Set fill color with opacity
          strokeWidth: 0,
        ),
      );
      circles.add(
        Circle(
          circleId: CircleId('2_miles_radius'),
          center: location,
          radius: 3218.69, // 2 miles in meters
          fillColor: Color(0x2200FF00),
          strokeWidth: 0,
        ),
      );
      circles.add(
        Circle(
          circleId: CircleId('3_miles_radius'),
          center: location,
          radius: 4828.03, // 3 miles in meters
          fillColor: Color(0x22FF0000),
          strokeWidth: 0,
        ),
      );
      // Add more circles as needed for different radii
    });
  }
}
