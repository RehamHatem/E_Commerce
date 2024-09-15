import 'package:dartz/dartz.dart';
import '../../entity/failures.dart';
import '../../entity/home_tap/category_entity.dart';

abstract class HomeTapRepo {

  Future<Either<Failures,CategoryEntity>> getCategories();

}