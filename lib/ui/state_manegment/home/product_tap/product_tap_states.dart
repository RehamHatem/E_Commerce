import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/product_tap/product_entity.dart';

abstract class ProductTapStates {

}
class ProductTapInitState extends ProductTapStates{}
class ProductTapLoadingState extends ProductTapStates{
  String? load;
  ProductTapLoadingState({required this.load});
}
class ProductTapErrorState extends ProductTapStates{
  Failures? error;
  ProductTapErrorState({required this.error});
}
class ProductTapSuccesState extends ProductTapStates{
  ProductEntity productEntity;
  ProductTapSuccesState({required this.productEntity});
}