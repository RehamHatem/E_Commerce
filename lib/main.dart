import 'package:e_commerce/ui/view/auth/login/login_screen.dart';
import 'package:e_commerce/ui/view/auth/register/register_screen.dart';
import 'package:e_commerce/ui/view/home/home.dart';
import 'package:e_commerce/ui/view/home/tabs/cart/cart_screen.dart';
import 'package:e_commerce/ui/view/home/tabs/product_tap/widgets/product_details_view.dart';
import 'package:e_commerce/ui/view/splash.dart';
import 'package:e_commerce/ui/view/utils/app_theme.dart';
import 'package:e_commerce/ui/view/utils/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
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
          HomeScreenView.routeName:(context)=>HomeScreenView(),
          LoginScreen.routeName:(context)=>LoginScreen(),
          RegisterScreen.routeName:(context)=>RegisterScreen(),
          ProductDetailsView.routeName:(context)=>ProductDetailsView(),
          CartScreen.routeName:(context)=>CartScreen(),

        },
        theme: AppTheme.mainTheme,
      
      ),
    );
  }
}
