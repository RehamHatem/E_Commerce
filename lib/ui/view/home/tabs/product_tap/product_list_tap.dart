import 'package:e_commerce/ui/state_manegment/home/product_tap/product_tap_states.dart';
import 'package:e_commerce/ui/state_manegment/home/product_tap/product_tap_view_model.dart';
import 'package:e_commerce/ui/view/home/tabs/product_tap/widgets/grid_view_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../data/di.dart';
import '../../../utils/app_color.dart';
import '../../../utils/my_assets.dart';
import '../home_tap/widgets/custom_field.dart';

class ProductListTap extends StatelessWidget {
   ProductListTap({super.key});
  ProductTapViewModel productTapViewModel=ProductTapViewModel(productTapUseCases: injectProductTapUseCases());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductTapViewModel,ProductTapStates>(
      bloc: productTapViewModel..getProducts(),
      builder: (context, state) {
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
                  Row(children: [
                    Expanded(
                      child: CustomTextField(),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    ImageIcon(
                      AssetImage(MyAssets.shoppingCart),
                      size: 28.sp,
                      color: AppColors.primaryColor,
                    ),
                  ]),
                  SizedBox(
                    height: 24.h,
                  ),
                  state is ProductTapLoadingState?Center(child: CircularProgressIndicator(),):
                  Expanded(
                    child: GridView.builder(
                      itemCount: productTapViewModel.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 2.4,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h),
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            // Navigator.of(context).pushNamed(
                            //   ProductDetailsView.routeName,
                            // );
                          },
                          child: GridViewCardItem(dataEntity: productTapViewModel.products[index],),
                        );
                      },
                    ),
                  )
                ]),
          ),
        );
      },

    );
  }
}
