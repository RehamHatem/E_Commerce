import 'package:dartz/dartz.dart';

import '../../entity/failures.dart';
import '../../entity/favourite_tap/add_product_to_wish_list_entity.dart';
import '../../entity/product_tap/add_to_cart_entity.dart';
import '../../entity/product_tap/product_entity.dart';

abstract class ProductTapDataSource{
  Future<Either<Failures,ProductEntity>>getProducts();
  Future<Either<Failures,AddToCartEntity>>addToCart(String productId);
  Future<Either<Failures,AddProductToWishListEntity>>addToWishList(String productId);

}