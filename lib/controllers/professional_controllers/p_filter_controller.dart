// ignore_for_file: unnecessary_new, prefer_final_fields, unused_element, prefer_const_constructors, unnecessary_null_comparison, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:local_saviors/utils/color_utils.dart';
import "package:http/http.dart" as http;
import '../../utils/constant.dart';

class PFilterController extends GetxController {
  final keywordController = new TextEditingController();
  final jobTitleController = new TextEditingController();
  TextEditingController locationEditingController = TextEditingController();

  var jobTimeHours;
  var lat = 24.535;
  var long = 66.5;
  RxBool isLoading = false.obs;

  List filteredJobs = [];
  RxBool isAm = false.obs;
  RxDouble startDistance = 20.0.obs;
  RxDouble minRadius = 0.0.obs;

  RxDouble endDistance = 50.0.obs;
  RxDouble maxRadius = 0.0.obs;

  RxDouble startPrice = 150.0.obs;
  RxDouble minBudget = 150.0.obs;

  RxDouble endPrice = 200.0.obs;
  RxDouble maxBudget = 150.0.obs;

  String? selectedHours = '00';
  String? selectedMints = '00';

  DateTime selectedDate = DateTime.now();
  RxString selectedTimeWithDate = "".obs;

  var selectedDateFormat;
  var myFormat = DateFormat('MM/dd/yyyy');
  TextEditingController dateController = TextEditingController();

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
      dateController.text = myFormat.format(selectedDate);
      selectedDateFormat = selectedDate;
      update();
    }
  }

  Future<void> getFilteredJobs({
    int page = 1,
    int limit = 10,
  }) async {
    isLoading.value = true;

    var uri = Uri.parse('https://api.localsaviors.com/api/v1/job/filter');

    var queryParameters = {
      'page': page.toString(),
      'limit': limit.toString(),
      if (jobTitleController.text.isNotEmpty) 'title': jobTitleController.text,
      if (keywordController.text.isNotEmpty) 'keyword': keywordController.text,
      if (selectedDateFormat != null) 'job_date': selectedDateFormat.toIso8601String(),
      if (selectedTimeWithDate.value.isNotEmpty) 'start_time': "${selectedTimeWithDate.value}Z",
      if (lat != null) 'latitude': lat.toString(),
      if (long != null) 'longitude': long.toString(),
      if (minRadius.value != 0.0) 'min_radius': minRadius.value.toString(),
      if (maxRadius.value != 0.0) 'max_radius': maxRadius.value.toString(),
      if (minBudget.value != 0.0) 'min_budget': minBudget.value.toString(),
      if (maxBudget.value != 0.0) 'max_budget': maxBudget.value.toString(),
    };

    // var queryParameters = {
    //   'page': page.toString(),
    //   'limit': limit.toString(),
    //   if (jobTitleController.text.isNotEmpty) 'title': jobTitleController.text,
    //   if (keywordController.text.isNotEmpty) 'keyword': keywordController.text,
    //   if (selectedDateFormat != null) 'job_date': selectedDateFormat.toIso8601String(),
    //   // if (startTime != null) 'start_time': startTime.toIso8601String(),
    //   if (lat != null) 'latitude': lat.toString(),
    //   if (long != null) 'longitude': long.toString(),
    //   if (startDistance.value != 0.0) 'min_radius': '1',
    //   if (endDistance.value != 0.0) 'max_radius': '10',
    //   if (startPrice.value != 0.0) 'min_budget': '20',
    //   if (endPrice.value != 0.0) 'max_budget': '30',
    // };

    uri = uri.replace(queryParameters: queryParameters);

    var headers = {
      'Authorization': token.value,
    };
    var request = http.Request('GET', uri);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      isLoading.value = false;

      var responseBody = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseBody);
      filteredJobs = jsonResponse['data'];
      print(jsonResponse);
    } else {
      isLoading.value = false;

      print(response.reasonPhrase);
    }
  }
}
