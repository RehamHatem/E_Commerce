import 'package:e_commerce/ui/state_manegment/home/favourite_tap/favourite_tap_states.dart';
import 'package:e_commerce/ui/state_manegment/home/favourite_tap/favourite_tap_view_model.dart';
import 'package:e_commerce/ui/view/home/tabs/favourite_tap/widgets/wish_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../data/di.dart';
import '../../../utils/app_color.dart';
import '../../../utils/my_assets.dart';
import '../home_tap/widgets/custom_search_with_shopping_cart.dart';

class FavouriteTap extends StatelessWidget {
  FavouriteTap({super.key});
  FavouriteTapViewModel favouriteTapViewModel=FavouriteTapViewModel(favouritTapUseCases: injectFavouriteTapUseCases());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: favouriteTapViewModel..getWishList(),
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
                    CustomSearchWithShoppingCart(),
                    SizedBox(
                      height: 24.h,
                    ),
                    state is GetWishListLoadingState||state is RemoveFromWishListLoadingState?Center(child: CircularProgressIndicator(),):
                        state is GetWishListErrorState ? Center(child: Text(state.error!.errorMessage!),):
                        state is GetWishListSuccessState && favouriteTapViewModel.wishList!=null ?
                    Expanded(child: ListView.builder(itemBuilder:

                        (context, index) {

                      return WishListItem(wishListItem: favouriteTapViewModel.wishList![index],favouriteTapViewModel: favouriteTapViewModel,);
                    },itemCount: favouriteTapViewModel.wishList!.length)):Center(child: Text("No Wish List",style: TextStyle(
                          color: AppColors.primaryColor
                        ),),)

                  ]),
            )) ;
      },

    );
  }
}

