import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/cart/cart_entity.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/repo/repository/cart_screen_repo.dart';

class CartScreenUseCases {
  CartScreenRepo cartScreenRepo;
  CartScreenUseCases({required this.cartScreenRepo});
  Future<Either<Failures, CartEntity>>cartProducts() {
    return  cartScreenRepo.cartProducts();

  }


}