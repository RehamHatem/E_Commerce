import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/product_tap/add_to_cart_entity.dart';
import 'package:e_commerce/domain/entity/product_tap/product_entity.dart';

import '../../../../domain/entity/favourite_tap/add_product_to_wish_list_entity.dart';

abstract class ProductTapStates {

}
class ProductTapInitState extends ProductTapStates{}
class ProductTapLoadingState extends ProductTapStates{
  String? load;
  ProductTapLoadingState({required this.load});
}
class ProductTapErrorState extends ProductTapStates{
  Failures? error;
  ProductTapErrorState({required this.error});
}
class ProductTapSuccesState extends ProductTapStates{
  ProductEntity productEntity;
  ProductTapSuccesState({required this.productEntity});
}
class AddToCartLoadingState extends ProductTapStates{
  String? load;
  AddToCartLoadingState({required this.load});
}
class AddToCartErrorState extends ProductTapStates{
  Failures? error;
  AddToCartErrorState({required this.error});
}
class AddToCartSuccessState extends ProductTapStates{
  AddToCartEntity addToCartEntity;
  AddToCartSuccessState({required this.addToCartEntity});
}

class AddToWishListLoadingState extends ProductTapStates{
  String? load;
  AddToWishListLoadingState({required this.load});
}
class AddToWishListErrorState extends ProductTapStates{
  Failures? error;
  AddToWishListErrorState({required this.error});
}
class AddToWishListSuccessState extends ProductTapStates{
  AddProductToWishListEntity addProductToWishListEntity;
  AddToWishListSuccessState({required this.addProductToWishListEntity});
}