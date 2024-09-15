import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/usecase/auth_use_cases.dart';
import 'package:e_commerce/ui/state_manegment/auth/register/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/auth/auth_entity.dart';
import '../../../../domain/entity/failures.dart';

class RegisterViewModel extends Cubit<RegisterStates>{
  RegisterViewModel({required this.authUseCases}):super(LoadingState());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObscure = true;
  AuthUseCases authUseCases;
  void register() async{
    emit(LoadingState());
    var either = await authUseCases.invoke(nameController.text, phoneController.text, passwordController.text, emailController.text, confirmationPasswordController.text);
    return either.fold((l) {
      emit(ErrorState(errorMsg: l.errorMessage));
    }, (r) {
      emit(SuccessState(authEntity: r));
    },);

  }

}