import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/favourite_tap/get_wish_list_entity.dart';
import 'package:e_commerce/domain/entity/favourite_tap/remove_from_wish_list_enitit.dart';

abstract class FavouriteTapDataSource{
  Future<Either<Failures,GetWishListEntity>>getWishList();
  Future<Either<Failures,RemoveFromWishListEnitit>>removeFromWishList(String id);
}