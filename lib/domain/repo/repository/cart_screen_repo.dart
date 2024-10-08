import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/cart/cart_entity.dart';
import 'package:e_commerce/domain/entity/cart/remove_from_cart_entity.dart';
import 'package:e_commerce/domain/entity/cart/update_cart_item_count_entity.dart';
import 'package:e_commerce/domain/entity/failures.dart';

abstract class CartScreenRepo {
  Future<Either<Failures, CartEntity>> cartProducts();
  Future<Either<Failures,RemoveFromCartEntity>>removeFromCart(String productId);
  Future<Either<Failures,UpdateCartItemCountEntity>>updateCartItemCount(String productId,int count);
}