// ignore_for_file: unused_field

import 'dart:async';
import 'dart:math';
import 'package:location/location.dart';
import 'package:location/location.dart' as location_package;

import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService {
  final location_package.Location location = location_package.Location();
  LatLng? _lastEmittedPosition;

  Stream<LatLng> get locationStream => _locationController.stream;
  final _locationController = StreamController<LatLng>();

  Future<void> initialize() async {
    await location.enableBackgroundMode(enable: true);
    await location.changeSettings(
      accuracy: LocationAccuracy.high,
      interval: 1000, // 1 second updates
      distanceFilter: 5, // 5 meters minimum change
    );

    location.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        final newPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        _locationController.add(newPosition);
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

  void dispose() {
    _locationController.close();
  }
}
