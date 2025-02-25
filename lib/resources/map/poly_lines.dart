// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:developer';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constant.dart';
import 'distanceCalculator.dart';
import 'map_controller.dart';

class BarDetailsScreen extends StatefulWidget {
  final String barName;
  final LatLng barLocation;
  final String barAddress;
  final double barlat;
  final double barlong;
  BarDetailsScreen({
    required this.barName,
    required this.barLocation,
    required this.barAddress,
    required this.barlat,
    required this.barlong,
  });
  @override
  _BarDetailsScreenState createState() => _BarDetailsScreenState();
}

class _BarDetailsScreenState extends State<BarDetailsScreen> {
  final mapVm = Get.put(MapController());
  DistanceCalculator calculateDistance = DistanceCalculator();
  GoogleMapController? _mapController;
  Set<Polyline> _polylines = {};
  LatLng? userLocation;
  @override
  void initState() {
    super.initState();
    _initializeRoute();
  }

  List<LatLng> decodePolyline(String polyline) {
    List<LatLng> points = [];
    int index = 0, len = polyline.length;
    int lat = 0, lng = 0;
    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;
      shift = 0;
      result = 0;
      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;
      points.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return points;
  }

  Future<List<LatLng>> fetchRoute(LatLng origin, LatLng destination) async {
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${24.866378},${67.030903}&destination=${24.858435},${67.030044}&key=$googleMapKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['routes'].isNotEmpty) {
        final route = data['routes'][0]['overview_polyline']['points'];
        return decodePolyline(route);
      } else {
        throw Exception('No routes found');
      }
    } else {
      throw Exception('Failed to fetch directions');
    }
  }

  Future<void> _initializeRoute() async {
    userLocation = LatLng(24.866378, 67.030903);
    if (userLocation != null) {
      try {
        final routePoints = await fetchRoute(userLocation!, widget.barLocation);
        setState(() {
          _polylines.add(
            Polyline(
              polylineId: PolylineId(widget.barName),
              points: routePoints,
              color: const Color.fromARGB(255, 204, 0, 255),
              width: 5,
            ),
          );
        });
        _mapController?.animateCamera(CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(
              routePoints.map((p) => p.latitude).reduce((a, b) => a < b ? a : b),
              routePoints.map((p) => p.longitude).reduce((a, b) => a < b ? a : b),
            ),
            northeast: LatLng(
              routePoints.map((p) => p.latitude).reduce((a, b) => a > b ? a : b),
              routePoints.map((p) => p.longitude).reduce((a, b) => a > b ? a : b),
            ),
          ),
          40,
        ));
      } catch (e) {
        log('Failed to fetch route: $e');
      }
    }
  }

  Future<void> _applyMapStyle() async {
    String style = await DefaultAssetBundle.of(context).loadString('assets/map_style.json');
    _mapController?.setMapStyle(style);
  }

  @override
  Widget build(BuildContext context) {
    double barLatt = widget.barlat.toDouble();
    double barLong = widget.barlong.toDouble();
    double distanceInMiles = calculateDistance.calculateDistance(
        userLat: double.parse(hsController.userdata.userDetails!.latitude.toString()),
        userLng: double.parse(hsController.userdata.userDetails!.longitude.toString()),
        barLat: barLatt,
        barLng: barLong);
    log('Distance to the bar: ${distanceInMiles.toStringAsFixed(2)} miles');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 20.w,
              height: 5.h,
              decoration: BoxDecoration(
                  color: Color.fromARGB(0, 0, 0, 255),
                  border: Border.all(color: const Color(0xffC97AD2)),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              // child: Image.asset(
              //   "assets/icons/Icon ionic-ios-arrow-back.png",
              //   scale: 3.5,
              // ),
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        title: Text(
          "Store Location",
          style: GoogleFonts.roboto(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: widget.barLocation,
              zoom: 15.0,
            ),
            onMapCreated: (controller) {
              _mapController = controller;
              // _applyMapStyle();
            },
            polylines: _polylines,
            markers: {
              Marker(
                markerId: MarkerId('barMarker'),
                position: widget.barLocation,
                infoWindow: InfoWindow(title: widget.barName),
              ),
            },
            myLocationEnabled: true,
            mapType: MapType.normal,
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          //     Container(
          //       width: 900.w,
          //       // height: 250.h,
          //       decoration: BoxDecoration(
          //           gradient: LinearGradient(
          //             colors: [
          //               Color(0xffc356d0),
          //               Color(0xff6b2f71),
          //             ],
          //             begin: Alignment.topLeft,
          //             end: Alignment.bottomRight,
          //           ),
          //           border: Border.all(color: Color(0xffC97AD2)),
          //           borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          //       child: Column(
          //         children: [
          //           23.verticalSpace,
          //           Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 20),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 SizedBox(
          //                   width: 200.w,
          //                   child: Text(
          //                     maxLines: 2,
          //                     widget.barName,
          //                     overflow: TextOverflow.ellipsis,
          //                     style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.sp),
          //                   ),
          //                 ),
          //                 Row(
          //                   children: [
          //                     Image.asset(
          //                       "assets/icons/Icon material-location-on-1.png",
          //                       scale: 4.5,
          //                     ),
          //                     5.horizontalSpace,
          //                     Text(
          //                       "${distanceInMiles.toStringAsFixed(2)} miles",
          //                       style: GoogleFonts.roboto(color: Colors.white, fontSize: 12),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //           15.verticalSpace,
          //           Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 20),
          //             child: Row(
          //               children: [
          //                 Icon(
          //                   Icons.location_on,
          //                   color: Color(0xffEBBEF1),
          //                   size: 20,
          //                 ),
          //                 10.horizontalSpace,
          //                 SizedBox(
          //                   width: 280.w,
          //                   child: Text(
          //                     maxLines: 3,
          //                     widget.barAddress,
          //                     overflow: TextOverflow.ellipsis,
          //                     style: GoogleFonts.roboto(color: Colors.white, fontSize: 14.sp),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           10.verticalSpace,
          //           Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 20),
          //             child: Row(
          //               children: [
          //                 Icon(
          //                   Icons.phone,
          //                   color: Color(0xffEBBEF1),
          //                   size: 20,
          //                 ),
          //                 10.horizontalSpace,
          //                 // SizedBox(
          //                 //   width: 280.w,
          //                 //   child: Text(
          //                 //     maxLines: 3,
          //                 //     mapVm.singleBarDataList[0]['formatted_phone_number'] ?? '-',
          //                 //     overflow: TextOverflow.ellipsis,
          //                 //     style: GoogleFonts.roboto(color: Colors.white, fontSize: 14.sp),
          //                 //   ),
          //                 // ),
          //               ],
          //             ),
          //           ),
          //           10.verticalSpace,
          //           Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 20),
          //             child: Row(
          //               children: [
          //                 Icon(
          //                   Icons.access_time,
          //                   color: Color(0xffEBBEF1),
          //                   size: 20,
          //                 ),
          //                 10.horizontalSpace,
          //                 // SizedBox(
          //                 //   width: 280.w,
          //                 //   child: Text(
          //                 //     maxLines: 3,
          //                 //     getCurrentDayTimings(mapVm.singleBarDataList[0]),
          //                 //     overflow: TextOverflow.ellipsis,
          //                 //     style: GoogleFonts.roboto(color: Colors.white, fontSize: 14.sp),
          //                 //   ),
          //                 // ),
          //               ],
          //             ),
          //           ),
          //           15.verticalSpace,
          //         ],
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
