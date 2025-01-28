// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CreatePorfileTwoController extends GetxController {
  String selectedProfession = 'Select Profession';
  // String selectedProfession2 = 'Profession 1';
  List<String> proffesionsName = [];
  var professions = <String>[].obs;
  RxBool isLoading = false.obs;
  RxList professionsList = [].obs;
  List professionIds = [];
  List allProfessions = [];

  @override
  void onInit() {
    super.onInit();
    professions.add("Profession 1");

    getProffessions(); // Initial profession
  }

  getProffessions() async {
    isLoading.value = true;
    final uri = Uri.parse("https://api.localsaviors.com/api/v1/public/professions");

    http.Response response = await http.get(uri);
    var resData = json.decode(response.body.toString());
    if (resData['status']['success'] == true) {
      isLoading.value = false;
      allProfessions = resData['data'];
      proffesionsName.insert(0, 'Select Profession');
      for (var i = 0; i < resData['data'].length; i++) {
        proffesionsName.add(resData['data'][i]['name']);
      }

      print(proffesionsName);
    } else {
      isLoading.value = false;
    }
  }

  void addProfession() {
    professionsList.add(DissMissed(dismissed: proffesionsName[professionsList.length + 1]));
    selectProfessions(proffesionsName[professionsList.length + 1]);

    print(professionsList.length);
  }

  void removeProfession(index) {
    professionsList.removeAt(index);
    log(professionsList.length.toString());
  }

  selectProfessions(profession) {
    for (var i = 0; i < allProfessions.length; i++) {
      if (profession == allProfessions[i]['name']) {
        if (!professionIds.contains(allProfessions[i]['id'])) {
          professionIds.add({'id': allProfessions[i]['id'], 'name': allProfessions[i]['name']});
        }
      }
    }

    log('Profession ids ${professionIds}');
  }

  unselectProfessions(profession) {
    for (var i = 0; i < professionIds.length; i++) {
      if (profession == professionIds[i]['name']) {
        professionIds.removeAt(i);
      }
    }
    log('Profession ids ${professionIds}');
  }
}

class DissMissed {
  int? id;
  String dismissed;
  DissMissed({this.id, required this.dismissed});
}
