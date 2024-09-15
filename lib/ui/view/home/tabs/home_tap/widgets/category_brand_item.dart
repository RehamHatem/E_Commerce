import 'package:e_commerce/domain/entity/home_tap/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_color.dart';

class CategoryOrBrandItem extends StatelessWidget {
  //todo: categoryOrBrand model
  DataEntity dataEntity;
  CategoryOrBrandItem({required this.dataEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CircleAvatar(
            backgroundImage: NetworkImage(dataEntity.image??""),
            radius: 50.r,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
          flex: 2,
          child: Text(
            dataEntity.name??"name",
            textWidthBasis: TextWidthBasis.longestLine,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 14.sp,
              color: AppColors.darkPrimaryColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        )
      ],
    );
  }
}