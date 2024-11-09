// ignore_for_file: prefer_final_fields, unused_local_variable

import 'package:foodly/constants/constants.dart';
import 'package:foodly/models/api_error.dart';
import 'package:foodly/models/foods_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchFoodController extends GetxController {
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  RxBool _isTriggered = false.obs;

  bool get isTriggered => _isTriggered.value;

  set setTriggered(bool value) {
    _isTriggered.value = value;
  }

  List<Food>? searchResults;

  void searchFoods(String key) async {
    setLoading = true;

    Uri uri = Uri.parse('$appBaseUrl/api/v1/foods/search/$key');

    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        searchResults = foodFromJson(response.body);
        setLoading = false;
      } else {
        setLoading = false;
        var error = apiErrorFromJson(response.body);
      }
    } catch (ex) {
      setLoading = false;
    }
  }
}
