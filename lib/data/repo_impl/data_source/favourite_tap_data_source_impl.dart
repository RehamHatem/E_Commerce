import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/data/api.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/favourite_tap/get_wish_list_entity.dart';
import 'package:e_commerce/domain/repo/data_source/favourite_tap_data_source.dart';

import '../../../domain/entity/favourite_tap/remove_from_wish_list_enitit.dart';

class FavouriteTapDataSourceImpl implements FavouriteTapDataSource{
  var apiManeger=ApiManeger.instance();
  FavouriteTapDataSourceImpl({required this.apiManeger});
  @override
  Future<Either<Failures, GetWishListEntity>> getWishList() async{
    var either = await apiManeger.getWishList();
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    },);

  }
  Future<Either<Failures, RemoveFromWishListEnitit>> removeFromWishList(String id) async {
    var either= await apiManeger.removeFromWishList(id);
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    },);
  }

}