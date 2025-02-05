// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/controllers/category_controller.dart';
import 'package:foodly/views/categories/all_categories.dart';
import 'package:get/get.dart';

import '../../../models/categories_model.dart';

class CategoryWidget extends StatelessWidget {
   CategoryWidget({
    super.key,
    required this.category,
  });

  CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return GestureDetector(
        onTap: () {
          if (controller.categoryValue == category.id) {
            controller.updateCategory('');
            controller.updateTitle('');
          } else if (category.value == 'more') {
            Get.to(
              () => const AllCategories(),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 900),
            );
          } else {
            controller.updateCategory(category.id);
            controller.updateTitle(category.title);
          }
        },
        child: Obx(
          () => Container(
            margin: EdgeInsets.only(right: 5.w),
            padding: EdgeInsets.only(top: 4.h),
            width: width * 0.19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                  color: controller.categoryValue == category.id
                      ? kSecondary
                      : kOffWhite,
                  width: .5.w),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 35.h,
                  child: Image.network(
                    category.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  category.title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: kDark,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
