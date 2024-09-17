import 'package:e_commerce/data/di.dart';
import 'package:e_commerce/domain/entity/product_tap/product_entity.dart';
import 'package:e_commerce/ui/state_manegment/home/product_tap/product_tap_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/my_assets.dart';

class GridViewCardItem extends StatelessWidget {
  bool isWishlisted = false;
 DataEntity dataEntity;

 GridViewCardItem({required this.dataEntity});
  //todo: product
  @override
  Widget build(BuildContext context) {
    var bloc=BlocProvider.of<ProductTapViewModel>(context);
    return Container(
      width: 191.w,
      height: 300.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.network(
                  dataEntity.imageCover??"",
                  fit: BoxFit.fill,
                  width: 191.w,
                  height: 128.h,
                ),
              ),
              Positioned(
                top: 5.h,
                right: 2.w,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: IconButton(
                    color: AppColors.primaryColor,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: isWishlisted == true
                        ? const Icon(Icons.favorite_rounded)
                        : const Icon(
                      Icons.favorite_border_rounded,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              dataEntity.title??"",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 14.sp,
                color: AppColors.darkPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              children: [
                Text(
                  dataEntity.price.toString()+" EGP",
                  maxLines: 1,

                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.darkPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
            child: Row(
              children: [
                Text(
                 "Review "+ dataEntity.ratingsAverage.toString()??"",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.darkPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Icon(Icons.star, size: 30.sp,color: Colors.yellow,),
                const Spacer(
                  flex: 1,
                ),
                InkWell(
                  onTap: () {
                    bloc.addToCart(dataEntity.id??"");

                    },
                  splashColor: Colors.transparent,
                  child: Icon(
                    Icons.add_circle,
                    size: 32.sp,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          )
          // GridViewCardItemBody(
          //   productEntity: productEntity,
          // )
        ],
      ),
    );
  }
}