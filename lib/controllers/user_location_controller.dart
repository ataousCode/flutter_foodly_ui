// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

class UserLocationController extends GetxController {
  LatLng position = const LatLng(0, 0);

  void setPosition(LatLng value) {
    value = position;
    update();
  }

  final RxString _address = ''.obs;
  String get address => _address.value;

  set setAddress(String value) {
    _address.value = value;
  }

  final RxString _postalCode = ''.obs;
  String get postalCode => _postalCode.value;

  set setPostalCode(String value) {
    _postalCode.value = value;
  }

  void getUserAddress(LatLng position) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$googleApiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);

      // Check if 'results' is not empty
      if (responseBody['results'].isNotEmpty) {
        final address = responseBody['results'][0]['formatted_address'];
        setAddress = address;

        final addressComponents =
            responseBody['results'][0]['address_components'];

        for (var component in addressComponents) {
          if (component['types'].contains('postal_code')) {
            setPostalCode = component['long_name'];
          }
        }
      } else {
        // Handle the case where 'results' is empty
        print('No address found for this location.');
        setAddress = 'Address not found';
        setPostalCode = 'Postal code not available';
      }
    } else {
      // Handle the case where the HTTP request fails
      print('Failed to fetch address. Status code: ${response.statusCode}');
    }
  }

  // void getUserAddress(LatLng position) async {
  //   final url = Uri.parse(
  //       'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$googleApiKey');

  //   final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     final responseBody = jsonDecode(response.body);

  //     // final address = responseBody['results'][0]['formatted_address'];
  //     // setAddress = address;

  //     final address = responseBody['results'][0]['formatted_address'];
  //     setAddress = address;

  //     // final addressComponents =
  //     //     responseBody['results'][0]['address_components'];
  //     final addressComponents =
  //         responseBody['results'][0]['address_components'];

  //     // for (var component in addressComponents) {
  //     //   if (component['types'].contains('postal_code')) {
  //     //     setPostalCode = component['long_name'];
  //     //   }
  //     // }
  //     for (var component in addressComponents) {
  //       if (component['types'].contains('postal_code')) {
  //         setPostalCode = component['long_name'];
  //       }
  //     }
  //   }
  // }
}
