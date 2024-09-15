import 'package:e_commerce/domain/entity/home_tap/category_brands_entity.dart';

abstract class HomeScreenStates {

}
class InitState extends HomeScreenStates{}
class ChangNavBar extends HomeScreenStates{}
class CatLoadingState extends HomeScreenStates{
  String? load;
  CatLoadingState({required this .load});
}
class CatErrorState extends HomeScreenStates{
  String ? error;
  CatErrorState({required this.error});
}
class CatSuccessState extends HomeScreenStates{
  CategoryBrandsEntity categoryEntity;
  CatSuccessState({required this.categoryEntity});
}