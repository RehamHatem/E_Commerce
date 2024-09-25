
import 'package:e_commerce/domain/entity/cart/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../../../../state_manegment/cart/cart_view_model.dart';
import '../../../../utils/app_color.dart';
import '../../product_tap/widgets/product_details_view.dart';


class CartItem extends StatelessWidget {
  CartProductsEntity cartProduct;

    // Function() itemRemoved ;
    // Function() addCount ;
    // Function() decrementCount ;
  String id;
  int count;


  CartItem({required this.cartProduct,required this.cartViewModel,required this.id,required this.count});
  CartViewModel cartViewModel ;

  removeItem(String id){
    print("Removing product with ID: $id");
    // if(count==1){
      cartViewModel.removeFromCart(id);
    // }
    // else if (count>1){
    //   decreaseCount(id , count);
    // }


  }

  addCount(String id,int count){
    cartViewModel.updateCartItemCount(id, count+1);

  }

  decreaseCount(String id,int count){
    if(count >0){
      cartViewModel.updateCartItemCount(id, count-1);
    }
    else{
      removeItem(id);
    }

  }

  @override
  Widget build(BuildContext context) {
    if(cartProduct.product==null){
      return Container(
        height:100,width:100,color: Colors.yellow,);
    }
    return Padding(
      padding:
      EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h, bottom: 24.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(width: 1.w, color: AppColors.lightGreyColor)),
        width: 398.w,
        height: 145.h,
        child: Row(children: [

          Container(
            clipBehavior: Clip.antiAlias,
            height: 145.h,
            width: 130.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Image.network(cartProduct.product!.imageCover?? "https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png", fit: BoxFit.fill),
          ),

          Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex:3,
                              child: Text(cartProduct.product!.title??"title",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,

                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  removeItem(id);
                                },
                                child: Icon(
                                  Icons.delete_outline,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 13.h, bottom: 13.h),
                        child: Row(
                          children: [
                            Text('Count: ${cartProduct.count}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: AppColors.blueGreyColor)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 14.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('EGP ${cartProduct.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold)),
                              Container(
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(
                                    100.r,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {

                                        // if(cartProduct.count!=null  && cartProduct.count! > 1){
                                        //   cartProduct.count=cartProduct.count!-1;
                                        // }
                                        decreaseCount(id,count);


                                      },
                                      icon: Icon(
                                        Icons.remove_circle_outline_rounded,
                                        color: AppColors.whiteColor,
                                        size: 28.sp,
                                      ),
                                    ),
                                    Text(
                                      cartProduct.count.toString(),
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.whiteColor),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        //todo: increment count
                                        // if(cartProduct.count!=null){
                                        //   cartProduct.count=cartProduct.count!+1;
                                        // }
                                        addCount(id,count);


                                      },
                                      icon: Icon(
                                        Icons.add_circle_outline_rounded,
                                        color: AppColors.whiteColor,
                                        size: 28.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
              )),
        ]),
      ),
    );
  }
}