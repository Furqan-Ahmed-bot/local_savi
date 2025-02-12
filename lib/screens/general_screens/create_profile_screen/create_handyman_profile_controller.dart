// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CreateHandymanPorfileController extends GetxController {
  String selectedProfession = 'Select Category';
  List<String> proffesionsName = [];
  var professions = <String>[].obs;
  RxBool isLoading = false.obs;
  RxList categoryList = [].obs;
  List professionIds = [];
  List allProfessions = [];

  @override
  void onInit() {
    super.onInit();
    getCategories();
    categoryList.add(DissMissed(
      id: categoryList.length,
      dismissed: 'Select Category',
    ));
  }

  getCategories() async {
    isLoading.value = true;
    final uri = Uri.parse("https://api.localsaviors.com/api/v1/public/categories");

    http.Response response = await http.get(uri);
    var resData = json.decode(response.body.toString());
    if (resData['status']['success'] == true) {
      isLoading.value = false;
      allProfessions = resData['data'];
      proffesionsName.clear(); // Clear the list before adding new items
      proffesionsName.add('Select Category'); // Add "Select Profession" only once
      for (var i = 0; i < resData['data'].length; i++) {
        proffesionsName.add(resData['data'][i]['category_name']);
      }
    } else {
      isLoading.value = false;
    }
  }

  void addProfession() {
    categoryList.add(DissMissed(
      id: categoryList.length, // Assign a unique ID
      dismissed: 'Select Category', // Default value
    ));
    update(); // Notify listeners
  }

  void removeProfession(index) {
    unselectProfessions(categoryList[index].dismissed);
    categoryList.removeAt(index);
    log(categoryList.length.toString());
  }

  void selectProfessions(String profession, int index) {
    String previousProfession = categoryList[index].dismissed;
    if (previousProfession != 'Select Category') {
      unselectProfessions(previousProfession);
    }

    for (var i = 0; i < allProfessions.length; i++) {
      if (profession == allProfessions[i]['category_name']) {
        if (!professionIds.any((item) => item['id'] == allProfessions[i]['id'])) {
          professionIds.add({
            'id': allProfessions[i]['id'],
            'name': allProfessions[i]['category_name'],
          });
          log('Profession added: ${allProfessions[i]['name']}');
        } else {
          log('Profession already exists: ${allProfessions[i]['name']}');
        }
      }
    }

    categoryList[index].dismissed = profession;
    log('Profession ids: $professionIds');
  }

  void unselectProfessions(String profession) {
    professionIds.removeWhere((item) => item['name'] == profession);
    log('Profession removed: $profession');
    log('Profession ids: $professionIds');
  }
}

class DissMissed {
  int id; // Unique ID
  String dismissed;
  DissMissed({required this.id, required this.dismissed});
}
