import 'package:e_commerce/domain/usecase/auth_use_cases.dart';
import 'package:e_commerce/ui/state_manegment/auth/login/states.dart';
import 'package:e_commerce/ui/view/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit<LoginStates>{
  LoginViewModel({required this .authUseCases}):super(LoadingState());
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  bool isObscure = true;
  AuthUseCases authUseCases;
  void login() async{
    emit(LoadingState());
    var either= await authUseCases.login(emailController.text, passwordController.text);
    return either.fold((l) {
      emit(ErrorState(errorMsg: l.errorMessage));

    }, (r) {
      emit(SuccessState(authEntity: r));

    },);
    }

  }


