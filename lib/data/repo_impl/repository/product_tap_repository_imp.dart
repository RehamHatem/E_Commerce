import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/favourite_tap/add_product_to_wish_list_entity.dart';
import 'package:e_commerce/domain/entity/product_tap/add_to_cart_entity.dart';
import 'package:e_commerce/domain/entity/product_tap/product_entity.dart';
import 'package:e_commerce/domain/repo/data_source/product_tap_data_source.dart';
import 'package:e_commerce/domain/repo/repository/product_tap_repo.dart';

class ProductTapRepositoryImp implements ProductTapRepo{
  ProductTapDataSource productTapDataSource;
  ProductTapRepositoryImp({required this.productTapDataSource});
  @override
  Future<Either<Failures, ProductEntity>> getProducts() async {
    var either= await productTapDataSource.getProducts();
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    },);
  }

  @override
  Future<Either<Failures, AddToCartEntity>> addToCart(String productId)async {
    var either= await productTapDataSource.addToCart(productId);
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    },);
  }

  @override
  Future<Either<Failures, AddProductToWishListEntity>> addToWishList(String productId)async {
    var either= await productTapDataSource.addToWishList(productId);
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    },);
  }

}