import 'package:e_commerce/domain/usecase/favourit_tap_use_cases.dart';
import 'package:e_commerce/ui/state_manegment/home/favourite_tap/favourite_tap_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/product_tap/product_entity.dart';

class FavouriteTapViewModel extends Cubit<FavouriteTapStates>{
  FavouriteTapViewModel({required this.favouritTapUseCases}):super(FavouriteTapInitState());
  FavouritTapUseCases favouritTapUseCases;
  List<DataEntity>? wishList=[];
  void getWishList()async{
    emit(GetWishListLoadingState(load: "loading"));
    var either=await favouritTapUseCases.getWishList();
    return either.fold((l) {
      emit(GetWishListErrorState(error: l));
    }, (r) {
      wishList=r.data;
      emit(GetWishListSuccessState(getWishListEntity: r));
    },);

  }

  void removeFromWishList(String id)async{
    emit(RemoveFromWishListLoadingState(load: "loading"));
    var either=await favouritTapUseCases.removeFromWishList(id);
    return either.fold((l) {
      emit(RemoveFromWishListErrorState(error: l));
    }, (r) {
      emit(RemoveFromWishListSuccessState(removeFromWishListEntiti:r));
      getWishList();
    },);

  }
}