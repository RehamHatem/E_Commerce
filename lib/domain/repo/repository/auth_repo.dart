import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/auth_entity.dart';

import '../../entity/failures.dart';

abstract class AuthRepository{
  Future<Either<Failures,AuthEntity>>register(String name,String phone,String password , String email , String confirmPass);

}
