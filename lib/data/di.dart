/*
* viwmodel=>usecase
* usecase=>repo
* repo=>datasource
* datasoucre=>api
*
* */

import 'package:e_commerce/data/data/api.dart';
import 'package:e_commerce/data/repo_impl/data_source/auth_data_source_impl.dart';
import 'package:e_commerce/data/repo_impl/repository/auth_repository_impl.dart';
import 'package:e_commerce/domain/repo/data_source/auth_data_source.dart';
import 'package:e_commerce/domain/repo/repository/auth_repo.dart';
import 'package:e_commerce/domain/usecase/auth_use_cases.dart';
import 'package:e_commerce/ui/state_manegment/auth/register/register_view_model.dart';


   AuthUseCases injectUseCase( ){
    return AuthUseCases(injectAuthRepository());
  }
   AuthRepository injectAuthRepository(){
    return AuthRepositoryImpl(dataSource: injectAuthDataSource());
  }
   AuthDataSource injectAuthDataSource(){
    return AuthDataSourceImpl(injectApiManeger());

  }
  ApiManeger injectApiManeger(){
    return ApiManeger.instance();
  }


