import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home_tap/category_entity.dart';

abstract class HomeTapDataSource{
 Future<Either<Failures,CategoryEntity>> getCategories();
}