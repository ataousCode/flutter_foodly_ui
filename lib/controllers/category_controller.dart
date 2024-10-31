// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxString _category = ''.obs; //value observable

  String get categoryValue => _category.value;

  void updateCategory(String value) {
    _category.value = value;
  }

  RxString _title = ''.obs; //value observable

  String get titleValue => _title.value;

  void updateTitle(String value) {
    _title.value = value;
  }
}
