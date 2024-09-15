import 'package:e_commerce/ui/state_manegment/home/home_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/home_tap/category_entity.dart';
import '../../../domain/usecase/home_tap_use_cases.dart';

class HomeTapViewModel extends Cubit<HomeScreenStates>{
  HomeTapViewModel({required this .homeTapUseCases}):super(InitState());
  HomeTapUseCases homeTapUseCases;
  List<DataEntity > categoryList=[];

  void getCtegories() async{
    emit(CatLoadingState(load: "Loading"));
    var either = await homeTapUseCases.getCtecories();
    return either.fold((l) {
      emit(CatErrorState(error: l.errorMessage));

    }, (r) {
      categoryList=r.data??[];
      emit(CatSuccessState(categoryEntity: r));

    },);

  }
}