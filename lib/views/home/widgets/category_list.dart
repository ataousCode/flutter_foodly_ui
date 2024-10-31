import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/constants/uidata.dart';
import 'package:foodly/controllers/category_controller.dart';
import 'package:foodly/views/categories/all_categories.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Container(
      height: 80.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(categories.length, (index) {
          var category = categories[index];
          return GestureDetector(
              onTap: () {
                if (controller.categoryValue == category['_id']) {
                  controller.updateCategory('');
                  controller.updateTitle('');
                } else if (controller.titleValue == 'More') {
                  Get.to(
                    () => const AllCategories(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 900),
                  );
                } else {
                  controller.updateCategory(category['_id']);
                  controller.updateTitle(category['title']);
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
                        color: controller.categoryValue == category['_id']
                            ? kSecondary
                            : kOffWhite,
                        width: .5.w),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 35.h,
                        child: Image.network(
                          category['imageUrl'],
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        category['title'],
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
        }),
      ),
    );
  }
}