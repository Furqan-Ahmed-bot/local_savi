// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_saviors/utils/constant.dart';

import 'location_services.dart';
import 'track_manager.dart';

class TrackNowMap extends StatefulWidget {
  final String jobId;

  const TrackNowMap({required this.jobId});

  @override
  _TrackNowMapState createState() => _TrackNowMapState();
}

class _TrackNowMapState extends State<TrackNowMap> {
  late TrackingManager _trackingManager;
  final LocationService _locationService = LocationService();
  LatLng selectedLatLng = LatLng(24.8607, 67.0011);

  @override
  void initState() {
    super.initState();
    _initializeTracking();
  }

  Future<void> _initializeTracking() async {
    await _locationService.initialize();
    _trackingManager = TrackingManager(
      socket: socketController.socket,
      locationService: _locationService,
      jobId: widget.jobId,
    );
    _trackingManager.startTracking();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: selectedLatLng, zoom: 15),

      // your map configuration
      polylines: {
        Polyline(
          polylineId: PolylineId('tracking_route'),
          points: _trackingManager.polylinePoints,
          color: Colors.blue,
          width: 5,
        ),
      },
      markers: {
        if (_trackingManager.otherUserLocation != null)
          Marker(
            markerId: MarkerId('other_user'),
            position: _trackingManager.otherUserLocation!,
          ),
      },
    );
  }

  @override
  void dispose() {
    _trackingManager.stopTracking();
    super.dispose();
  }
}
