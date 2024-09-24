import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/cart/cart_entity.dart';
import 'package:e_commerce/domain/entity/cart/remove_from_cart_entity.dart';
import 'package:e_commerce/domain/entity/cart/update_cart_item_count_entity.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/repo/data_source/cart_screen_data_source.dart';
import 'package:e_commerce/domain/repo/repository/cart_screen_repo.dart';

class CartScreenRepositoryImpl implements CartScreenRepo{
  CartScreenDataSource cartScreenDataSource;
  CartScreenRepositoryImpl({required this.cartScreenDataSource});
  @override
  Future<Either<Failures, CartEntity>> cartProducts() async{
    var either = await cartScreenDataSource.cartProducts();
    return either.fold((l) {
      return left(l);
    },(r) {
      return right(r);
    },);
  }

  @override
  Future<Either<Failures, RemoveFromCartEntity>> removeFromCart(String productId) async{
    var either=await cartScreenDataSource.removeFromCart(productId);
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    },);
  }

  @override
  Future<Either<Failures, UpdateCartItemCountEntity>> updateCartItemCount(String productId, int count) async {
   var either = await cartScreenDataSource.updateCartItemCount(productId, count);
   return either.fold((l) {
     return left(l);
   }, (r) {
     return right(r);
   },);
  }

}