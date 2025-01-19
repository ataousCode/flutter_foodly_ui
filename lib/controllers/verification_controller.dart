// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly/views/entrypoint.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/constants.dart';
import '../models/api_error.dart';
import '../models/login_response.dart';
import 'package:http/http.dart' as http;

class VerificationController extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;

  String _code = '';

  String get code => _code;

  set setCode(String value) {
    _code = value;
  }

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void verificationFunction() async {
    setLoading = true;
    String accessToken = box.read('token');

    Uri uri = Uri.parse('$appBaseUrl/api/v1/users/verify/$code');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };

    try {
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        LoginResponse data = loginResponseFromJson(response.body);

        String userId = data.id;
        String userData = jsonEncode(data);

        box.write(userId, userData);
        box.write('token', data.userToken);
        box.write('userId', data.id);
        box.write('verification', data.verification);

        setLoading = false;

        Get.snackbar(
          'You are successfully verified',
          'Enjoy foodly',
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: const Icon(
            Ionicons.fast_food_outline,
          ),
        );
        Get.offAll(() => MainScreen());
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar(
          'Failed to verify account.',
          error.message,
          colorText: kLightWhite,
          backgroundColor: kRed,
          icon: const Icon(Icons.error_outline),
        );
      }
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}
