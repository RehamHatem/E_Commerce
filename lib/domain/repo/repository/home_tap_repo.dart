import 'package:dartz/dartz.dart';
import '../../entity/failures.dart';
import '../../entity/home_tap/category_brands_entity.dart';

abstract class HomeTapRepo {

  Future<Either<Failures,CategoryBrandsEntity>> getCategories();
  Future<Either<Failures,CategoryBrandsEntity>> getBrands();

}