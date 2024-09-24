import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/cart/cart_entity.dart';
import 'package:e_commerce/domain/entity/failures.dart';

import '../../entity/cart/remove_from_cart_entity.dart';

abstract class CartScreenDataSource{
  Future<Either<Failures,CartEntity>> cartProducts();
  Future<Either<Failures,RemoveFromCartEntity>>removeFromCart(String productId);
}