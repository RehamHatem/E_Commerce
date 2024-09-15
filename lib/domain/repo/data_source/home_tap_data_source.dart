import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home_tap/category_brands_entity.dart';

abstract class HomeTapDataSource{
 Future<Either<Failures,CategoryBrandsEntity>> getCategories();
 Future<Either<Failures,CategoryBrandsEntity>> getBrands();
}