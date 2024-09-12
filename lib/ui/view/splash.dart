
import 'dart:async';

import 'package:e_commerce/ui/view/auth/login/login_screen.dart';
import 'package:flutter/material.dart';



class Splash extends StatefulWidget {
  static const String routeName="splash";
   Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}


class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });

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
