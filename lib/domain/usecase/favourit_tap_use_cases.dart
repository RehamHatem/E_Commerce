import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/favourite_tap/get_wish_list_entity.dart';
import 'package:e_commerce/domain/entity/favourite_tap/remove_from_wish_list_enitit.dart';

import '../repo/repository/favourite_tap_repo.dart';

class FavouritTapUseCases{
  FavouriteTapRepo favouriteTapRepo;
  FavouritTapUseCases({required this.favouriteTapRepo});
  Future<Either<Failures,GetWishListEntity>>getWishList(){
    return favouriteTapRepo.getWishList();
  }
  Future<Either<Failures,RemoveFromWishListEnitit>>removeFromWishList(String id){
    return favouriteTapRepo.removeFromWishList(id);
  }
}