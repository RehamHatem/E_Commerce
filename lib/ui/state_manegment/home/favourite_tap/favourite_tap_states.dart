import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/favourite_tap/get_wish_list_entity.dart';

import '../../../../domain/entity/favourite_tap/remove_from_wish_list_enitit.dart';

abstract class FavouriteTapStates{

}
class FavouriteTapInitState extends FavouriteTapStates{

}
class GetWishListLoadingState extends FavouriteTapStates{
  String?load;
  GetWishListLoadingState({required this.load});

}
class GetWishListErrorState extends FavouriteTapStates{
  Failures? error;
  GetWishListErrorState({required this.error});

}
class GetWishListSuccessState extends FavouriteTapStates{
  GetWishListEntity? getWishListEntity;
  GetWishListSuccessState({required this.getWishListEntity});

}


class RemoveFromWishListLoadingState extends FavouriteTapStates{
  String?load;
  RemoveFromWishListLoadingState({required this.load});

}
class RemoveFromWishListErrorState extends FavouriteTapStates{
  Failures? error;
  RemoveFromWishListErrorState({required this.error});

}
class RemoveFromWishListSuccessState extends FavouriteTapStates{
  RemoveFromWishListEnitit? removeFromWishListEntiti;
  RemoveFromWishListSuccessState({required this.removeFromWishListEntiti});

}