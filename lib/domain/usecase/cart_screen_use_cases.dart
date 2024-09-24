import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/cart/cart_entity.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/repo/repository/cart_screen_repo.dart';

import '../entity/cart/remove_from_cart_entity.dart';
import '../entity/cart/update_cart_item_count_entity.dart';

class CartScreenUseCases {
  CartScreenRepo cartScreenRepo;
  CartScreenUseCases({required this.cartScreenRepo});
  Future<Either<Failures, CartEntity>>cartProducts() {
    return  cartScreenRepo.cartProducts();

  }
  Future<Either<Failures,RemoveFromCartEntity>>removeFromCart(String productId){
    return cartScreenRepo.removeFromCart(productId);

  }
  Future<Either<Failures,UpdateCartItemCountEntity>>updateCartItemCount(String productId,int count){
    return cartScreenRepo.updateCartItemCount(productId, count);
  }



}