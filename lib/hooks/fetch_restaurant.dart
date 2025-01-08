import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/models/api_error.dart';
import 'package:foodly/models/hook_models/restaurant_hook.dart';
import 'package:foodly/models/restaurants_model.dart';
import 'package:http/http.dart' as http;

FetchRestaurant useFetchRestaurant(String code) {
  final restaurants = useState<Restaurants?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      Uri url = Uri.parse('$appBaseUrl/api/v1/restaurants/$code');
      final response = await http.get(url);
      //print("responded: ${response.statusCode}");
      if (response.statusCode == 200) {
        var restaurant = jsonDecode(response.body);
        restaurants.value = Restaurants.fromJson(restaurant);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (ex) {
      // error.value = Exception(ex.toString());
      debugPrint(ex.toString());
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchRestaurant(
    data: restaurants.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
