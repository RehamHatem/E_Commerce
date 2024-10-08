import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../state_manegment/home/product_tap/product_tap_view_model.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/my_assets.dart';
import 'custom_field.dart';

class CustomSearchWithShoppingCart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
          child: CustomTextField(),
        ),
        SizedBox(
          width: 24.w,
        ),
        InkWell(
          onTap: () {},
          child: ImageIcon(
            AssetImage(MyAssets.shoppingCart),
            size: 28.sp,
            color: AppColors.primaryColor,
          ),
        )
      ],
    );
  }
}