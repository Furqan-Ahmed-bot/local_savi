import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:local_saviors/utils/color_utils.dart';

class EditJobScreenController extends GetxController {
  final Rx<LatLng> selectedLocation = LatLng(0.0, 0.0).obs;
  RxInt groupValue = 0.obs;
  RxBool isAm = false.obs;
  RxInt fixedAmoount = 0.obs;
  var jobDetail;
  String? selectedHours = '00';
  String? selectedMints = '00';
  RxString selectedTimeWithDate = "".obs;

  DateTime selectedDate = DateTime.now();
  var myFormat = DateFormat('yyyy/MM/dd');
  TextEditingController dateController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController locationEditingController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  List listOfNetworkImages = [];
  List listOfRemovedIndex = [];
  File? image;
  List listOfImages = [];
  final picker = ImagePicker();

  var latitide;
  var longitude;

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      listOfImages.add(image);
      update();
    } else {}
  }

  @override
  void onInit() {
    // jobDetail = Get.arguments['jobDetail'] ??
    jobDetail = {
      "id": "59e01a22-ac4c-41dc-9cf1-6f02ffe452f2",
      "user_id": "82cdc4a2-168e-4f1c-a85b-33a9778a2b15",
      "performer_id": null,
      "payment_intent_id": null,
      "transaction_id": null,
      "payout_id": null,
      "transfer_id": null,
      "category_id": null,
      "title": "wow edit",
      "job_date": "2025-12-15T13:00:00.000Z",
      "start_time": "2025-12-15T13:00:00.000Z",
      "description":
          "this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! this is testing job! ",
      "location": "kharadar, Uk",
      "latitude": "24.5324",
      "longitude": "66.432234",
      "tax_amount": null,
      "net_amount": null,
      "commission_charges": null,
      "gross_amount": null,
      "is_paid": false,
      "completed_at": null,
      "decided_cost": null,
      "job_status": "OPEN",
      "payment_status": "PENDING",
      "worker_type": "PROFESSIONAL",
      "job_type": "WORKINGHOUR",
      "budget_type": "FIXED",
      "job_journey": null,
      "createdAt": "2025-02-21T05:22:01.000Z",
      "updatedAt": "2025-02-21T05:24:27.861Z",
      "address": "tin tapak",
      "city": "tapak",
      "state": "tin",
      "budget": 100,
      "is_paid_to_performer": false,
      "invite_users": [],
      "user_requests": [],
      "performer": null,
      "category": null,
      "dispute": null,
      "job_media": [
        {
          "id": "66166473-af58-4853-8b0c-be8f59efaf76",
          "job_id": "59e01a22-ac4c-41dc-9cf1-6f02ffe452f2",
          "media_name": "job_images",
          "media_file":
              "https://local-saviour-backend.s3.us-east-2.amazonaws.com/job_images/-1740115321416-download (1).jpg",
          "createdAt": "2025-02-21T05:22:01.000Z",
          "updatedAt": "2025-02-21T05:22:01.482Z"
        },
        {
          "id": "92e22c45-2a57-4ba8-aab3-bbe0fa63601a",
          "job_id": "59e01a22-ac4c-41dc-9cf1-6f02ffe452f2",
          "media_name": "job_images",
          "media_file":
              "https://local-saviour-backend.s3.us-east-2.amazonaws.com/job_images/-1740115467810-download (1).jpg",
          "createdAt": "2025-02-21T05:24:28.000Z",
          "updatedAt": "2025-02-21T05:24:27.866Z"
        }
      ],
      "cancel_job": null,
      "performer_average_ratings": 0
    };
    groupValue.value = jobDetail['worker_type'] == "PROFESSIONAL" ? 0 : 1;
    titleController.text = jobDetail['title'];
    dateController.text = jobDetail['job_date'];
    selectedHours = DateTime.parse("2025-12-15T13:00:00.000Z")
        .hour
        .toString()
        .padLeft(2, '0');
    selectedMints = DateTime.parse("2025-12-15T13:00:00.000Z")
        .minute
        .toString()
        .padLeft(2, '0');

    selectedDate = DateTime.parse(jobDetail['job_date'])
        .toLocal()
        .copyWith(hour: 0, minute: 0, second: 0, millisecond: 0);
    selectedTimeWithDate.value = jobDetail['start_time'];
    descController.text = jobDetail['description'];
    listOfNetworkImages = jobDetail['job_media'];
    addressController.text = jobDetail['location'];
    selectedLocation.value = LatLng(double.parse(jobDetail['latitude']),
        double.parse(jobDetail["longitude"]));
    fixedAmoount.value = jobDetail['budget_type'] == "FIXED" ? 0 : 1;
    priceController.text = jobDetail['budget'].toString();

    getPostion(double.parse(jobDetail['latitude']),
        double.parse(jobDetail["longitude"]));

    update();
    super.onInit();
  }

  getPostion(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      String address = "${placemark.name}, ${placemark.locality}";

      locationEditingController.text = address.toString();

      print(address);
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorUtils.black,
              background: ColorUtils.white,
              onPrimary: ColorUtils.white,
              onSurface: ColorUtils.black,
            ),
            dividerColor: ColorUtils.black,
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 100),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateController.text = myFormat.format(selectedDate); // Format the date
      update();
    }
  }

  bool isTimeValid(DateTime selectedDate, String selectedHours,
      String selectedMints, bool isAm) {
    DateTime now = DateTime.now();

    // Convert selected hours to 24-hour format based on AM/PM
    int hours = int.parse(selectedHours);
    if (!isAm && hours != 12) {
      hours += 12; // Convert to 24-hour format for PM
    } else if (isAm && hours == 12) {
      hours = 0; // 12 AM is 00:00 in 24-hour format
    }

    DateTime selectedTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      hours,
      int.parse(selectedMints),
    );

    // If the selected date is today, check if the selected time is after the current time
    if (selectedDate.year == now.year &&
        selectedDate.month == now.month &&
        selectedDate.day == now.day) {
      return selectedTime.isAfter(now);
    }

    // If the selected date is in the future, the time is always valid
    return true;
  }
}
