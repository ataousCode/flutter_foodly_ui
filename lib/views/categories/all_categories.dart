import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/back_ground_container.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/hooks/fetch_all_categories.dart';
import 'package:foodly/models/categories_model.dart';
import 'package:foodly/views/categories/widgets/category_tile.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFecthAllCategories();
    List<CategoriesModel>? categories = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: 'Categories',
          style: appStyle(17, kGray, FontWeight.w600),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: height,
          child: isLoading
              ? const FoodsListShimmer()
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(categories!.length, (index) {
                    CategoriesModel category = categories[index];
                    return CategoryTile(category: category);
                  }),
                ),
        ),
      ),
    );
  }
}
