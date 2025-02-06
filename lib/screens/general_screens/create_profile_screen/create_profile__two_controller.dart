// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CreatePorfileTwoController extends GetxController {
  String selectedProfession = 'Select Profession';
  List<String> proffesionsName = [];
  var professions = <String>[].obs;
  RxBool isLoading = false.obs;
  RxList professionsList = [].obs;
  List professionIds = [];
  List allProfessions = [];

  @override
  void onInit() {
    super.onInit();
    getProffessions();
    professionsList.add(DissMissed(
      id: professionsList.length,
      dismissed: 'Select Profession',
    ));
  }

  getProffessions() async {
    isLoading.value = true;
    final uri = Uri.parse("https://api.localsaviors.com/api/v1/public/professions");

    http.Response response = await http.get(uri);
    var resData = json.decode(response.body.toString());
    if (resData['status']['success'] == true) {
      isLoading.value = false;
      allProfessions = resData['data'];
      proffesionsName.clear(); // Clear the list before adding new items
      proffesionsName.add('Select Profession'); // Add "Select Profession" only once
      for (var i = 0; i < resData['data'].length; i++) {
        proffesionsName.add(resData['data'][i]['name']);
      }
    } else {
      isLoading.value = false;
    }
  }

  void addProfession() {
    professionsList.add(DissMissed(
      id: professionsList.length, // Assign a unique ID
      dismissed: 'Select Profession', // Default value
    ));
    update(); // Notify listeners
  }

  void removeProfession(index) {
    unselectProfessions(professionsList[index].dismissed);
    professionsList.removeAt(index);
    log(professionsList.length.toString());
  }

  void selectProfessions(String profession, int index) {
    String previousProfession = professionsList[index].dismissed;
    if (previousProfession != 'Select Profession') {
      unselectProfessions(previousProfession);
    }

    for (var i = 0; i < allProfessions.length; i++) {
      if (profession == allProfessions[i]['name']) {
        if (!professionIds.any((item) => item['id'] == allProfessions[i]['id'])) {
          professionIds.add({
            'id': allProfessions[i]['id'],
            'name': allProfessions[i]['name'],
          });
          log('Profession added: ${allProfessions[i]['name']}');
        } else {
          log('Profession already exists: ${allProfessions[i]['name']}');
        }
      }
    }

    professionsList[index].dismissed = profession;
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
