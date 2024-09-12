import 'package:e_commerce/ui/view/auth/login/login_screen.dart';
import 'package:e_commerce/ui/view/auth/register/register_screen.dart';
import 'package:e_commerce/ui/view/home.dart';
import 'package:e_commerce/ui/view/splash.dart';
import 'package:e_commerce/ui/view/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Splash.routeName,
      
        routes: {
          Splash.routeName:(context)=>Splash(),
          Home.routeName:(context)=>Home(),
          LoginScreen.routeName:(context)=>LoginScreen(),
          RegisterScreen.routeName:(context)=>RegisterScreen(),
      
        },
        theme: AppTheme.mainTheme,
      
      ),
    );
  }
}
