import 'package:geolocator/geolocator.dart';

class DistanceCalculator {
  double calculateDistance({
    required double userLat,
    required double userLng,
    required double barLat,
    required double barLng,
  }) {
    double distanceInMeters = Geolocator.distanceBetween(
      userLat,
      userLng,
      barLat,
      barLng,
    );
    // Convert meters to miles (1 meter = 0.000621371 miles)
    return distanceInMeters * 0.000621371;
  }
}
