import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/favourite_tap/get_wish_list_entity.dart';
import 'package:e_commerce/domain/entity/favourite_tap/remove_from_wish_list_enitit.dart';
import 'package:e_commerce/domain/repo/data_source/favourite_tap_data_source.dart';
import 'package:e_commerce/domain/repo/repository/favourite_tap_repo.dart';
import 'package:flutter/cupertino.dart';

class FavouriteTapRepositoryImpl implements FavouriteTapRepo{
  FavouriteTapDataSource favouriteTapDataSource;
  FavouriteTapRepositoryImpl({required this.favouriteTapDataSource});
  @override
  Future<Either<Failures, GetWishListEntity>> getWishList() async {
   var either= await favouriteTapDataSource.getWishList();
   return either.fold((l) {
     return left(l);
   }, (r) {
     return right(r);
   },);
  }
  Future<Either<Failures, RemoveFromWishListEnitit>> removeFromWishList(String id) async {
    var either= await favouriteTapDataSource.removeFromWishList(id);
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    },);
  }

}