import 'package:e_commerce/ui/state_manegment/home/home_tap/home_screen_states.dart';
import 'package:e_commerce/ui/state_manegment/home/home_tap/home_screen_view_model.dart';

import 'package:e_commerce/ui/view/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenView extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  HomeScreenViewModel homeScreenViewModel=HomeScreenViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel,HomeScreenStates>(
      bloc: homeScreenViewModel,
      builder: (context, state) {
        return
        Scaffold(
          bottomNavigationBar: buildCustomBottomNavigationBar(
            context: context,
            selectedIndex: homeScreenViewModel.selectedIndex,
            onTapFunction: (index) {

              homeScreenViewModel.selectedNavBar(index);
            },
          ),
          body: homeScreenViewModel.tabs[homeScreenViewModel.selectedIndex],
        );
      },

    );
  }
}
