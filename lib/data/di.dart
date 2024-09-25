/*
* viwmodel=>usecase
* usecase=>repo
* repo=>datasource
* datasoucre=>api
*
* */

import 'package:e_commerce/data/data/api.dart';
import 'package:e_commerce/data/repo_impl/data_source/auth_data_source_impl.dart';
import 'package:e_commerce/data/repo_impl/data_source/car_screen_data_source_impl.dart';
import 'package:e_commerce/data/repo_impl/data_source/favourite_tap_data_source_impl.dart';
import 'package:e_commerce/data/repo_impl/data_source/home_tap_data_source_impl.dart';
import 'package:e_commerce/data/repo_impl/data_source/product_data_source_impl.dart';
import 'package:e_commerce/data/repo_impl/repository/auth_repository_impl.dart';
import 'package:e_commerce/data/repo_impl/repository/cart_screen_repository_impl.dart';
import 'package:e_commerce/data/repo_impl/repository/favourite_tap_repository_impl.dart';
import 'package:e_commerce/data/repo_impl/repository/home_tap_repository_imp.dart';
import 'package:e_commerce/data/repo_impl/repository/product_tap_repository_imp.dart';
import 'package:e_commerce/domain/repo/data_source/auth_data_source.dart';
import 'package:e_commerce/domain/repo/data_source/home_tap_data_source.dart';
import 'package:e_commerce/domain/repo/data_source/product_tap_data_source.dart';
import 'package:e_commerce/domain/repo/repository/auth_repo.dart';
import 'package:e_commerce/domain/repo/repository/favourite_tap_repo.dart';
import 'package:e_commerce/domain/repo/repository/home_tap_repo.dart';
import 'package:e_commerce/domain/repo/repository/product_tap_repo.dart';
import 'package:e_commerce/domain/usecase/auth_use_cases.dart';
import 'package:e_commerce/domain/usecase/home_tap_use_cases.dart';
import 'package:e_commerce/domain/usecase/product_tap_use_cases.dart';
import 'package:e_commerce/ui/state_manegment/auth/register/register_view_model.dart';

import '../domain/repo/data_source/cart_screen_data_source.dart';
import '../domain/repo/data_source/favourite_tap_data_source.dart';
import '../domain/repo/repository/cart_screen_repo.dart';
import '../domain/usecase/cart_screen_use_cases.dart';
import '../domain/usecase/favourit_tap_use_cases.dart';


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
  HomeTapUseCases injectHomeTapUseCases(){
     return HomeTapUseCases(homeTapRepo: injectHomeTapRepo());
  }
  HomeTapRepo injectHomeTapRepo(){
     return HomeTapRepositoryImp(homeTapDataSource: injectHomeTapDataSource());
  }
  HomeTapDataSource injectHomeTapDataSource(){
     return HomeTapDataSourceImpl(apiManeger: injectApiManeger());
  }

  ProductTapUseCases injectProductTapUseCases(){
     return ProductTapUseCases(productTapRepo: injectProductTapRepo());
  }
  ProductTapRepo injectProductTapRepo(){
     return ProductTapRepositoryImp(productTapDataSource: injectProductTapDataSource());
  }
  ProductTapDataSource injectProductTapDataSource(){
     return ProductDataSourceImpl(apiManeger: injectApiManeger());
  }


CartScreenUseCases injectCartScreenUseCases(){
  return CartScreenUseCases(cartScreenRepo: injectCartScreenRepo());
}
CartScreenRepo injectCartScreenRepo(){
  return CartScreenRepositoryImpl(cartScreenDataSource:injectCartScreenDataSource() );
}
CartScreenDataSource injectCartScreenDataSource(){
  return CarScreenDataSourceImpl(apiManeger: injectApiManeger());
}


FavouritTapUseCases injectFavouriteTapUseCases(){
  return FavouritTapUseCases(favouriteTapRepo: injectFavouriteTapRepo());
}
FavouriteTapRepo injectFavouriteTapRepo(){
  return FavouriteTapRepositoryImpl(favouriteTapDataSource:injectFavouriteTapDataSource() );
}
FavouriteTapDataSource injectFavouriteTapDataSource(){
  return FavouriteTapDataSourceImpl(apiManeger: injectApiManeger());
}
