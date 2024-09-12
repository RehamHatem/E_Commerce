import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/repo_impl/data_source/auth_data_source_impl.dart';

import 'package:e_commerce/domain/entity/auth_entity.dart';

import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/repo/data_source/auth_data_source.dart';

import '../../../domain/repo/repository/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthDataSource dataSource;
  AuthRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failures, AuthEntity>> register(String name, String phone, String password, String email, String confirmPass) async{
    var either= await dataSource.register(name, phone, password, email, confirmPass);
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    },);
  }

}