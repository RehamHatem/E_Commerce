import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repo/repository/home_tap_repo.dart';

import '../entity/failures.dart';
import '../entity/home_tap/category_brands_entity.dart';

class HomeTapUseCases{
  HomeTapRepo homeTapRepo;
  HomeTapUseCases({required this.homeTapRepo});
  Future<Either<Failures, CategoryBrandsEntity>> getCtecories(){
   return homeTapRepo.getCategories();
  }
  Future<Either<Failures,CategoryBrandsEntity>>getBrands(){
    return homeTapRepo.getBrands();

  }

}