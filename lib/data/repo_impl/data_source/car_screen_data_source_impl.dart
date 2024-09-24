import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/data/api.dart';
import 'package:e_commerce/domain/entity/cart/cart_entity.dart';
import 'package:e_commerce/domain/entity/cart/remove_from_cart_entity.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/repo/data_source/cart_screen_data_source.dart';

class CarScreenDataSourceImpl implements CartScreenDataSource{
  var apiManeger=ApiManeger.instance();
  CarScreenDataSourceImpl({required this.apiManeger});
  @override
  Future<Either<Failures, CartEntity>> cartProducts() async {
   var either= await apiManeger.cartProducts();
   return either.fold((l) {
     return left(l);
   }, (r) {
     return right(r);
   },);
  }

  @override
  Future<Either<Failures, RemoveFromCartEntity>> removeFromCart(String productId) async{
    var either = await apiManeger.removeFromCart(productId);
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    },);
  }

}