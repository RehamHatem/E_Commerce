import 'package:e_commerce/domain/usecase/product_tap_use_cases.dart';
import 'package:e_commerce/ui/state_manegment/home/product_tap/product_tap_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/product_tap/product_entity.dart';

class ProductTapViewModel extends Cubit<ProductTapStates>{
  ProductTapViewModel({required this.productTapUseCases}):super(ProductTapInitState());
  ProductTapUseCases productTapUseCases;
  List<DataEntity>products=[];
  void getProducts() async{
    emit(ProductTapLoadingState(load: "Loading..."));
    var either= await productTapUseCases.getProducts();
    return either.fold((l) {
      emit( ProductTapErrorState(error: l));
    }, (r) {
      products=r.data??[];
      emit(ProductTapSuccesState(productEntity: r));
    },);


  }

}