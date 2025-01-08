import 'package:foodly/models/additive_obs.dart';
import 'package:foodly/models/foods_model.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  RxInt currentPage = 0.obs;
  bool initialSelectedValue = false;
  var additivesList = <AdditiveObs>[].obs;

  void changePage(int index) {
    currentPage.value = index;
  }

  RxInt count = 1.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  void loadAdditives(List<Additive> additives) {
    additivesList.clear(); //clear the list if countain price

    for (var additivesInfo in additives) {
      var additive = AdditiveObs(
        id: additivesInfo.id,
        title: additivesInfo.title,
        price: additivesInfo.price,
        selected: initialSelectedValue,
      );
      //condition
      if (additives.length == additivesList.length) {
      } else {
        additivesList.add(additive);
      }
    }
  }

  // List<String> getList() {
  //   List<String> ads = [];

  //   for (var additive in additivesList) {
  //     if (additive.isSelected.value && !ads.contains(additive.title)) {
  //       ads.add(additive.title);
  //     } else if (!additive.isSelected.value && ads.contains(additive.title)) {
  //       ads.remove(additive.title);
  //     }
  //   }
  //   return ads;
  // }

  final RxDouble _totalPrice = 0.0.obs;
  double get additivePrice => _totalPrice.value;

  set setTotalPrice(double newPrice) {
    _totalPrice.value = newPrice;
  }

  double getTotalPrice() {
    double totalPrice = 0.0;

    for (var additive in additivesList) {
      if (additive.isSelected.value) {
        totalPrice += double.tryParse(additive.price) ?? 0.0;
      }
    }

    setTotalPrice = totalPrice;
    return totalPrice;
  }
}
