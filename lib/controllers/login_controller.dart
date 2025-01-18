// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/models/api_error.dart';
import 'package:foodly/models/login_response.dart';
import 'package:foodly/views/entrypoint.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../views/auth/verification_page.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  RxBool _isLogin = false.obs;

  bool get isLogin => _isLogin.value;

  set setLoading(bool newState) {
    _isLogin.value = newState;
  }

  void loginFunction(String data) async {
    setLoading = true;
    Uri uri = Uri.parse('$appBaseUrl/api/v1/authentications/login');

    try {
      var response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: data,
      );
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
          'You are logged in',
          'Enjoy foodly',
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: const Icon(
            Ionicons.fast_food_outline,
          ),
        );

        if (data.verification == false) {
          Get.offAll(
            () => const VerificationPage(),
            transition: Transition.fade,
            duration: const Duration(milliseconds: 900),
          );
        }
        if (data.verification == true) {
          Get.offAll(
            () => MainScreen(),
            transition: Transition.fade,
            duration: const Duration(milliseconds: 900),
          );
        }
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar(
          'Failed to login',
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

  void logout() {
    box.erase();
    // Get.snackbar(
    //   'You are logout',
    //   'Hope to see back soon.',
    //   colorText: kLightWhite,
    //   backgroundColor: kPrimary,
    //   icon: const Icon(
    //     Ionicons.fast_food_outline,
    //   ),
    // );

    Get.offAll(
      () => MainScreen(),
      transition: Transition.fade,
      duration: const Duration(milliseconds: 900),
    );
  }

  LoginResponse? getUserInfo() {
    String? userId = box.read('userId');
    String? data;
    if (userId != null) {
      data = box.read(userId.toString());
    }

    if (data != null) {
      return loginResponseFromJson(data);
    }
    return null;
  }
}
