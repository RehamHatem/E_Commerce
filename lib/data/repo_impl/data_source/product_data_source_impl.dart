import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/data/api.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/favourite_tap/add_product_to_wish_list_entity.dart';
import 'package:e_commerce/domain/entity/product_tap/add_to_cart_entity.dart';
import 'package:e_commerce/domain/entity/product_tap/product_entity.dart';
import 'package:e_commerce/domain/repo/data_source/product_tap_data_source.dart';
import 'package:flutter/cupertino.dart';

class ProductDataSourceImpl implements ProductTapDataSource{
  var apiManeger=ApiManeger.instance();
  ProductDataSourceImpl({required this.apiManeger});
  @override
  Future<Either<Failures, ProductEntity>> getProducts() async {
    var either= await apiManeger.getProducts();
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    },);

  }

  @override
  Future<Either<Failures, AddToCartEntity>> addToCart(String productId) async{
    var either=await apiManeger.addToCart(productId);
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    },);
  }

  @override
  Future<Either<Failures, AddProductToWishListEntity>> addToWishList(String productId) async{
    var either = await apiManeger.addProductToWishList(productId);
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    },);
  }

}