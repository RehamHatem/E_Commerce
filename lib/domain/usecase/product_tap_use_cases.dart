import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/favourite_tap/add_product_to_wish_list_entity.dart';
import 'package:e_commerce/domain/entity/product_tap/add_to_cart_entity.dart';
import 'package:e_commerce/domain/entity/product_tap/product_entity.dart';
import 'package:e_commerce/domain/repo/repository/product_tap_repo.dart';

class ProductTapUseCases {
  ProductTapRepo productTapRepo;
  ProductTapUseCases({required this.productTapRepo});
  Future<Either<Failures,ProductEntity>>getProducts(){
    return productTapRepo.getProducts();

  }
  Future<Either<Failures,AddToCartEntity>>addToCart(String productId){
    return productTapRepo.addToCart(productId);

  }
  Future<Either<Failures,AddProductToWishListEntity>>addToWishList(String productId){
    return productTapRepo.addToWishList(productId);

  }
}