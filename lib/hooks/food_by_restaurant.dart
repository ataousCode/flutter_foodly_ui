// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/controllers/category_controller.dart';
import 'package:foodly/models/api_error.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodly/models/foods_model.dart';
import 'package:foodly/models/hook_models/food_hook.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

FetchFoods useFecthRestaurantFoods(String id) {
  final controller = Get.put(CategoryController());
  final foods = useState<List<Food>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true; //41007428

    try {
      Uri url = Uri.parse(
          '$appBaseUrl/api/v1/restaurant-foods/$id');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        foods.value = foodFromJson(response.body);
      }
      // else {
      //   apiError.value = apiErrorFromJson(response.body);
      // }
    } catch (ex) {
      //error.value = Exception(ex.toString());
      debugPrint(ex.toString());
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    Future.delayed(const Duration(seconds: 3));
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchFoods(
    data: foods.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
