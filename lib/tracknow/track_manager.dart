// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:location/location.dart' as location_package;
import 'package:http/http.dart' as http;

import 'location_services.dart';

class TrackingManager {
  final Socket? socket;
  final LocationService locationService;
  final String jobId;
  LatLng? otherUserLocation;
  List<LatLng> polylinePoints = [];
  LatLng? _lastEmittedPosition;

  TrackingManager({
    required this.socket,
    required this.locationService,
    required this.jobId,
  });

  void startTracking() {
    // First get initial position
    getTrackingDataFirst(jobId);

    // Set up listener for other user's updates
    getTrackingData(jobId);

    // Set up our own position tracking
    locationService.locationStream.listen((ourPosition) {
      if (_shouldEmitPosition(ourPosition)) {
        _emitOurPosition(ourPosition);
      }
    });
  }

  double _calculateDistance(LatLng pos1, LatLng pos2) {
    const earthRadius = 6371000; // meters
    final dLat = _toRadians(pos2.latitude - pos1.latitude);
    final dLng = _toRadians(pos2.longitude - pos1.longitude);

    final a = sin(dLat / 2) * sin(dLat / 2) + cos(_toRadians(pos1.latitude)) * cos(_toRadians(pos2.latitude)) * sin(dLng / 2) * sin(dLng / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double _toRadians(double degree) {
    return degree * pi / 180;
  }

  bool _shouldEmitPosition(LatLng newPosition) {
    if (_lastEmittedPosition == null) {
      _lastEmittedPosition = newPosition;
      return true;
    }

    final distance = _calculateDistance(_lastEmittedPosition!, newPosition);

    return distance >= 10; // Emit if moved 10m or more
  }

  void _emitOurPosition(LatLng position) {
    socket?.emit('update_position', {
      'job_id': jobId,
      'latitude': position.latitude,
      'longitude': position.longitude,
    });
    _lastEmittedPosition = position;
  }

  void getTrackingDataFirst(String jobId) {
    socket?.emit("get_tracking", {'job_id': jobId});
  }

  void getTrackingData(String jobId) {
    socket?.on('track_now_$jobId', (data) async {
      try {
        final lat = double.parse(data['latitude'].toString());
        final lng = double.parse(data['longitude'].toString());
        otherUserLocation = LatLng(lat, lng);

        // Add to polyline points
        polylinePoints.add(otherUserLocation!);

        // Update map if needed
        if (otherUserLocation != null) {
          await fetchRoute();
        }
      } catch (e) {
        print(e);
      }
    });
  }

  // Future<void> fetchRoute() async {
  //   // Implement your route fetching logic here
  //   // This should update the polyline on your map
  // }

  Future<void> fetchRoute() async {
    if (otherUserLocation == null || polylinePoints.isEmpty) return;

    try {
      // Use the last known position and the other user's current position
      final origin = polylinePoints.isNotEmpty ? polylinePoints.last : otherUserLocation!;
      final destination = otherUserLocation!;

      String url = 'https://maps.googleapis.com/maps/api/directions/json?'
          'origin=${origin.latitude},${origin.longitude}&'
          'destination=${destination.latitude},${destination.longitude}&'
          'key=$googleMapKey';

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['routes'].isNotEmpty) {
          final route = data['routes'][0]['overview_polyline']['points'];
          final routePoints = _decodePolyline(route);

          // Update the polyline points with the new route segment
          polylinePoints.addAll(routePoints);

          // Create the polyline set
          final updatedPolylines = {
            Polyline(
              polylineId: PolylineId('tracking_route_$jobId'),
              points: polylinePoints,
              color: Colors.blue,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              geodesic: true,
            ),
          };

          // If you're using a map controller, update it here
          /*
        if (mapController != null) {
          // Clear existing polylines and add new ones
          mapController!.clearPolylines();
          mapController!.addPolyline(updatedPolylines.first);
          
          // Fit the map to show the entire route
          final bounds = _boundsFromLatLngList(polylinePoints);
          final cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
          mapController!.animateCamera(cameraUpdate);
        }
        */

          // Or if you're using a state-managed approach:
          // _updatePolylines(polylinePoints);
        } else {
          print('No routes found');
        }
      } else {
        print('Failed to fetch directions: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching route: $e');
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return points;
  }

// Helper function to calculate bounds from a list of points
  LatLngBounds _boundsFromLatLngList(List<LatLng> list) {
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
      northeast: LatLng(x1!, y1!),
      southwest: LatLng(x0!, y0!),
    );
  }

  void stopTracking() {
    socket?.off('track_now_$jobId');
    locationService.dispose();
  }
}
