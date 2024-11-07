import 'package:foodly/constants/constants.dart';
import 'package:foodly/models/Categories.dart';
import 'package:foodly/models/api_error.dart';
import 'package:foodly/models/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchHook useFecthCategories() {
  final categoriesItems = useState<List<CategoriesModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      Uri url = Uri.parse('$appBaseUrl/api/v1/categories/random');
      final response = await http.get(url);

      if (response.statusCode == 20) {
        categoriesItems.value = categoriesModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (ex) {
      error.value = ex as Exception;
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

  return FetchHook(
    data: categoriesItems.value,
    isLoading: isLoading.value,
    error: error.value,
    refectch: refetch,
  );
}
