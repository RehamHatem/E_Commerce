
import 'dart:async';

import 'package:e_commerce/ui/view/auth/login/login_screen.dart';
import 'package:e_commerce/ui/view/home/home.dart';
import 'package:e_commerce/ui/view/utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Splash extends StatefulWidget {
  static const String routeName="splash";
   Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}


class _SplashState extends State<Splash> {

Future<void> autoLogin()async{
  await SharedPreference.init();
  var user=SharedPreference.getData(key: 'Token' );
  String route;
  if(user==null){
    route= LoginScreen.routeName;
  }else route=HomeScreenView.routeName;
  Timer(Duration(seconds: 5),(){
    Navigator.pushReplacementNamed(context, route);
  });
}
  @override
  void initState()  {
    super.initState();
    autoLogin();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/Splash Screen.png"),fit: BoxFit.fill),

      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

      ),
    );
  }
}
