import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/my_assets.dart';

class AnnouncementsSection extends StatelessWidget {
  List<String> sliderImages = [
    MyAssets.img1,
    MyAssets.img2,
    MyAssets.img3
  ];

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      initialPage: 0,
      indicatorColor: AppColors.primaryColor,
      indicatorBackgroundColor: AppColors.whiteColor,
      indicatorBottomPadding: 20.h,
      autoPlayInterval: 3000,
      isLoop: true,
      children: sliderImages
          .map((url) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          url,
          fit: BoxFit.fill,
          width: 398.w,
          height: 200.h,
        ),
      ))
          .toList(),
    );
  }
}