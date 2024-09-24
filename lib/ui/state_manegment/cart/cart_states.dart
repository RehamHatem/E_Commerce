import 'package:e_commerce/domain/entity/cart/cart_entity.dart';

import '../../../domain/entity/failures.dart';

abstract class CartStates {}
class InitCartState extends CartStates{}
class LoadingCartState extends CartStates{
  String? load;
  LoadingCartState({required this.load});
}
class ErrorCartState extends CartStates{
  Failures? error;
  ErrorCartState({required this.error});
}
class SuccessCartState extends CartStates{
  CartEntity cartEntity;
  SuccessCartState({required this.cartEntity});

}