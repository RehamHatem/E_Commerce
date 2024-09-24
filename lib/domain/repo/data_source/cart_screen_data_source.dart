import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/cart/cart_entity.dart';
import 'package:e_commerce/domain/entity/failures.dart';

abstract class CartScreenDataSource{
  Future<Either<Failures,CartEntity>> cartProducts();
}