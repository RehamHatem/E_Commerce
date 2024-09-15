import 'package:e_commerce/ui/state_manegment/home/home_tap/home_screen_states.dart';
import 'package:e_commerce/ui/state_manegment/home/home_tap/home_tap_view_model.dart';
import 'package:e_commerce/ui/view/home/tabs/home_tap/widgets/announcemet_section.dart';
import 'package:e_commerce/ui/view/home/tabs/home_tap/widgets/category_brand_section.dart';
import 'package:e_commerce/ui/view/home/tabs/home_tap/widgets/custom_search_with_shopping_cart.dart';
import 'package:e_commerce/ui/view/home/tabs/home_tap/widgets/row_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../data/di.dart';
import '../../../utils/app_color.dart';
import '../../../utils/my_assets.dart';

class HomeTap extends StatelessWidget {
  HomeTap({super.key});
HomeTapViewModel homeTapViewModel=HomeTapViewModel(homeTapUseCases: injectHomeTapUseCases());
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTapViewModel,HomeScreenStates>(
      bloc:homeTapViewModel..getCtegories()..getBrands() ,
      builder: (context, state) {
       return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
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
                    height: 16.h,
                  ),
                  AnnouncementsSection(),
                  SizedBox(
                    height: 16.h,
                  ),
                  RowSectionWidget(name: 'Categories'),
                  SizedBox(
                    height: 24.h,
                  ),
                  state is CatLoadingState ? Center(child: CircularProgressIndicator(),):
                  CategoriesOrBrandsSection(dataEntity: homeTapViewModel.categoryList,),
                  SizedBox(
                    height: 24.h,
                  ),
                  RowSectionWidget(name: 'Brands'),
                  SizedBox(
                    height: 24.h,
                  ),
                  state is CatLoadingState ? Center(child: CircularProgressIndicator(),):
                  CategoriesOrBrandsSection(dataEntity: homeTapViewModel.brandList,),
                  SizedBox(
                    height: 24.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
