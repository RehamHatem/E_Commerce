import 'package:e_commerce/domain/entity/cart/remove_from_cart_entity.dart';
import 'package:e_commerce/ui/state_manegment/cart/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/cart/cart_entity.dart';
import '../../../domain/usecase/cart_screen_use_cases.dart';

class CartViewModel extends Cubit<CartStates>{
  CartScreenUseCases cartScreenUseCases;
  CartViewModel({required this.cartScreenUseCases}):super(InitCartState());
  late CartDataEntity? products;
  late RemoveFromCartData? removeFromCartData;
void cartProducts() async{
  emit(LoadingCartState(load: "Loading..."));
  var either = await cartScreenUseCases.cartProducts();
  return either.fold((l) {
    emit(ErrorCartState(error: l));

  }, (r) {
    if (r.data != null) {
      products = r.data!;
      print (products!.products!);
      print ("--------------------------");
      emit(SuccessCartState(cartEntity: r));
    }

  },);


}

void removeFromCart(String productId) async{
  emit(RemoveLoadingCartState(load: "loading"));
  var either = await cartScreenUseCases.removeFromCart(productId);
  return either.fold((l) {
    emit(RemoveErrorCartState(error: l));
  }, (r) {
    if (r.data != null) {
    removeFromCartData=r.data!;
    print(removeFromCartData);
    // products?.products?.removeWhere((item) => item.product?.id == productId);
    emit(RemoveSuccessCartState(removeFromCartEntity: r));
    cartProducts();}
  },);

}
}