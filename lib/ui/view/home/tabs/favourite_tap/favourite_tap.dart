import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_color.dart';
import '../../../utils/my_assets.dart';
import '../home_tap/widgets/custom_search_with_shopping_cart.dart';

class FavouriteTap extends StatelessWidget {
  const FavouriteTap({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Image.asset(
                  MyAssets.logo,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  height: 18.h,
                ),
                CustomSearchWithShoppingCart(),
                SizedBox(
                  height: 24.h,
                ),
              ]),
        ));
  }
}

