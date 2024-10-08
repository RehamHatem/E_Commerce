import 'package:e_commerce/ui/state_manegment/home/home_tap/home_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view/home/tabs/favourite_tap/favourite_tap.dart';

import '../../../view/home/tabs/home_tap/home_tap.dart';
import '../../../view/home/tabs/product_tap/product_list_tap.dart';
import '../../../view/home/tabs/profile_tap/profile_tap.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(InitState());
  int selectedIndex = 0;


  List<Widget> tabs = [
    HomeTap(),
    ProductListTap(),
    FavouriteTap(),
    ProfileTap()
  ];
  void selectedNavBar(int index){
    emit(InitState());
    selectedIndex=index;
    tabs[index];
    emit(ChangNavBar());

  }


}