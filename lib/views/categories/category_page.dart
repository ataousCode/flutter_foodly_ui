import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/back_ground_container.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/controllers/category_controller.dart';
import 'package:get/get.dart';

import '../../hooks/fetch_category_foods.dart';
import '../../models/foods_model.dart';
import '../home/widgets/food_tile.dart';

class CategoryPage extends HookWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final hookResults = useFecthFoodsByCategories('41007428');
    List<Food>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        leading: IconButton(
          onPressed: () {
            controller.updateCategory('');
            controller.updateTitle('');
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kDark,
          ),
        ),
        title: ReusableText(
          text: '${controller.titleValue} Category',
          style: appStyle(13, kDark, FontWeight.w600),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: SizedBox(
          //padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: height,
          child: isLoading
              ? const FoodsListShimmer()
              : Padding(
                  padding: EdgeInsets.all(12.h),
                  child: ListView(
                    //scrollDirection: Axis.horizontal,
                    children: List.generate(
                      foods!.length,
                      (index) {
                        Food food = foods[index];
                        return FoodTile(food: food);
                      },
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
