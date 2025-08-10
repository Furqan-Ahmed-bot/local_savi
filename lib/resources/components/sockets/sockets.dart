// ignore_for_file: unnecessary_string_interpolations, prefer_if_null_operators, unnecessary_brace_in_string_interps, avoid_print

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_saviors/utils/api_services/app_urls.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'chats_controller.dart';

var userlat;
var userlng;

class SocketController extends GetxController {
  io.Socket? socket;
  final chatController = Get.put(GetChatController());
  // final myUserData = Get.find<UserProfileScreenController>();
  // final ChatController chatController = Get.find();
  // final jobDetails = Get.put(OngoingJobDetailScreenController());
  Rx<GoogleMapController?> mapController = Rx<GoogleMapController?>(null);
  Rx<LatLng?> otherUserLocation = Rx<LatLng?>(null);
  RxSet<Polyline> polylines = <Polyline>{}.obs;
  RxList<LatLng> trackingRoute = <LatLng>[].obs;
  TextEditingController messageController = TextEditingController();
  LatLng? userLLocation;
  LatLng? _lastEmittedLocation;

  connectSocket() {
    socket = io.io("${UserUrls.socketUrl}", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'force new connection': true,
      'query': {
        'access_token': token.value,
      },
    });

    socket!.on('connect', (_) async {
      print('Connected to socket server');

      //await onSocketEvents();

      //addChatListeners();
    });

    socket!.on('connect_error', (error) {
      print('Connection error: $error');
    });

    socket!.on('error', (error) {
      print('Socket error: $error');
    });

    socket!.on('disconnect', (reason) {
      print('Socket disconnected: $reason');
    });
  }

  onSocketEvents() {
    socket?.on('authenticate_me', (message) {
      try {
        print('MESSAGE: $message');
      } catch (e, stackTrace) {
        print('Error handling MESSAGE event: $e');
        print('Stack trace: $stackTrace');
      }
    });

    socket?.on('error', (message) {
      try {
        print('READ_MESSAGE: $message');
      } catch (e, stackTrace) {
        print('Error handling READ_MESSAGE event: $e');
        print('Stack trace: $stackTrace');
      }
    });

    socket?.on('allChats-user_id-${hsController.userdata.userID != null ? hsController.userdata.userID : phController.performerdata.userId}',
        (message) {
      chatController.loading.value = true;
      try {
        print('privateMessage: $message');
        chatController.chatsdata(message);
        // chatController.allMessages.insert(0, message);
      } catch (e, stackTrace) {
        print('Error handling privateMessage event: $e');
        print('Stack trace: $stackTrace');
      }
    });

    socket?.on('privateMessage', (message) {
      try {
        print('privateMessage: $message');
        chatController.allMessages.insert(0, message);
      } catch (e, stackTrace) {
        print('Error handling privateMessage event: $e');
        print('Stack trace: $stackTrace');
      }
    });

    socket?.on('private_message_success', (message) {
      try {
        print('privateMessage: $message');
      } catch (e, stackTrace) {
        print('Error handling privateMessage event: $e');
        print('Stack trace: $stackTrace');
      }
    });

    socket?.on('error', (message) {
      try {
        print('READ_MESSAGE: $message');
      } catch (e, stackTrace) {
        print('Error handling READ_MESSAGE event: $e');
        print('Stack trace: $stackTrace');
      }
    });
  }

  isOnline() {
    socket?.emit("ONLINE_STATUS");
  }

  sendOnlineAck() {
    socket!.emit("get_chats", {
      "access_token": token.value,
    });
  }

  leaveChatRoom(chatId) {
    socket!.emit("leave_chat", {"access_token": token.value, "chat_id": chatId});
  }

  void getTrackingData(String jobId) {
    socket!.on('track_now_${jobId}', (data) async {
      try {
        double lat = double.parse(data['latitude'].toString());
        double lng = double.parse(data['longitude'].toString());
        otherUserLocation.value = LatLng(lat, lng);

        otherUserLocation.value!.latitude;
        otherUserLocation.value!.longitude;

        if (otherUserLocation.value != null) {
          await fetchRoute();
        }
      } catch (e) {
        print("Error in getTrackingData: $e");
      }
    });
  }

  Future<void> fetchRoute() async {
    if (userlat == null || otherUserLocation.value == null) return;

    String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${userlat},${userlng}&destination=${otherUserLocation.value!.latitude},${otherUserLocation.value!.longitude}&key=$googleMapKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['routes'].isNotEmpty) {
          final route = data['routes'][0]['overview_polyline']['points'];
          final routePoints = _decodePolyline(route);

          polylines.clear();
          polylines.add(
            Polyline(
              polylineId: const PolylineId("tracking_route"),
              points: routePoints,
              color: Colors.blue,
              width: 5,
            ),
          );

          _moveCameraToRoute(routePoints);
        } else {
          print('No routes found');
        }
      } else {
        print('Failed to fetch directions');
      }
    } catch (e) {
      print('Error fetching route: $e');
    }
  }

  /// 🔹 Decode Polyline
  List<LatLng> _decodePolyline(String polyline) {
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

  /// 🗺 Move Camera to Route
  void _moveCameraToRoute(List<LatLng> routePoints) {
    if (mapController.value == null || routePoints.isEmpty) return;

    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(
        routePoints.map((p) => p.latitude).reduce((a, b) => a < b ? a : b),
        routePoints.map((p) => p.longitude).reduce((a, b) => a < b ? a : b),
      ),
      northeast: LatLng(
        routePoints.map((p) => p.latitude).reduce((a, b) => a > b ? a : b),
        routePoints.map((p) => p.longitude).reduce((a, b) => a > b ? a : b),
      ),
    );

    mapController.value!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 40));
  }

  void onMapCreated(GoogleMapController controller) {
    mapController.value = controller;
  }

  double _calculateDistanceInMeters(LatLng start, LatLng end) {
    const earthRadius = 6371000; // meters
    final dLat = (end.latitude - start.latitude) * (pi / 180);
    final dLng = (end.longitude - start.longitude) * (pi / 180);

    final a = sin(dLat / 2) * sin(dLat / 2) + cos(start.latitude * (pi / 180)) * cos(end.latitude * (pi / 180)) * sin(dLng / 2) * sin(dLng / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  giveTrackingData(jobId, lat, lng) {
    socket?.emit("track_now", {'job_id': '${jobId}', 'latitude': lat, 'longitude': lng});
  }

  void giveTrackingDataa(String jobId, double lat, double lng) {
    LatLng currentLocation = LatLng(lat, lng);

    if (_lastEmittedLocation == null || _calculateDistanceInMeters(_lastEmittedLocation!, currentLocation) >= 0.1) {
      socket?.emit("track_now", {
        'job_id': jobId,
        'latitude': lat,
        'longitude': lng,
      });

      _lastEmittedLocation = currentLocation;
      print("Socket emitted at $lat, $lng");
    } else {
      print("Movement < 10m — skipping emit");
    }
  }

  Future<void> startLocationUpdates(String jobId) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        return Future.error('Location permissions are denied.');
      }
    }

    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 1, // 🔹 Trigger only when moved 10 meters
      ),
    ).listen((Position position) {
      print('yesssss');
      if (position.latitude != 0.0 && position.longitude != 0.0) {
        giveTrackingDataa(
          jobId,
          position.latitude,
          position.longitude,
        );
      }
    });
  }

  getTrackingDataFirst(jobId) {
    socket?.emit("get_tracking", {'job_id': '${jobId}'});
  }

  joinChatRoom({dynamic id, dynamic chatId, dynamic jobId, Function? onSuccess}) async {
    if (chatId != null) {
      socket!.emit("join_private_chat", {
        "chat_id": chatId,
        "access_token": token.value,
      });
    } else {
      socket!.emit("join_private_chat", {
        "recipient_id": id,
        "job_id": jobId,
        "access_token": token.value,
      });
    }

    socket!.on('joined_private_chat_success', (data) {
      print("Joined Room $id $data");
      // If success callback is provided, call it
      if (onSuccess != null) {
        onSuccess(data);
      }
    });
  }

  // leaveChatRoom() {
  //   socket!.off('joinedPrivateChatSuccess');
  // }

  message({String? chatId, String? message, String? recipientId, String? jobId, var attachment}) {
    Map<String, dynamic> map = {
      if (chatId != null) "chat_id": chatId,
      "message": message,
      "access_token": token.value,
      "recipient_id": recipientId,
      if (attachment != null) "attachment": attachment,
      "job_id": jobId

      //  "createdAt": DateTime.now().toIso8601String(),
    };
    chatController.allMessages.insert(0, [map]);
    socket?.emit("private_chat_message", map);

    messageController.clear();
  }

  readMessage({required int chatId, required int chatEventId}) {
    socket?.emit("READ_MESSAGE", {
      "chatId": chatId,
      "chatEventId": chatEventId,
    });
  }

  disconnectSocket() {
    socket?.disconnect();
    print('Socket disconnected cleanly');
  }
}
