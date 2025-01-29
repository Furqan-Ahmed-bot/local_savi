// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  RxList<dynamic> selectedImages = <dynamic>[].obs;
  Rx<File?> selectedImage = Rx<File?>(null);

  Future<void> pickImages({bool isMultiImage = false}) async {
    try {
      if (isMultiImage) {
        final List<XFile>? images = await _picker.pickMultiImage();
        if (images != null) {
          selectedImages.addAll(images.map((image) => File(image.path)).toList());
        }
      } else {
        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          selectedImage.value = File(image.path);
          print(selectedImage.value);
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  void removeImage(int index) {
    selectedImages.removeAt(index);
  }
}
