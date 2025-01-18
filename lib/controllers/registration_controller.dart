import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly/models/success_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import '../models/api_error.dart';

class RegistrationController extends GetxController {
  final box = GetStorage();
  RxBool _isLogin = false.obs;

  bool get isLogin => _isLogin.value;

  set setLoading(bool newState) {
    _isLogin.value = newState;
  }

  void registrationFunction(String data) async {
    setLoading = true;
    Uri uri = Uri.parse('$appBaseUrl/api/v1/authentications/register');

    try {
      var response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: data,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var data = successModelFromJson(response.body);
        setLoading = false;
        Get.back();
        Get.snackbar(
          'You successfully registered',
          data.message,
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: const Icon(Ionicons.fast_food_outline),
        );
      } else {
        var error = apiErrorFromJson(response.body);
        setLoading = false;
        Get.snackbar(
          'Failed to register',
          error.message,
          colorText: kLightWhite,
          backgroundColor: kRed,
          icon: const Icon(Icons.error_outline),
        );
      }
    } catch (ex) {
      debugPrint('Exception: $ex');
      setLoading = false;
    }
  }
}
