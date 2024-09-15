import 'package:dartz/dartz.dart';

import '../../entity/failures.dart';
import '../../entity/product_tap/product_entity.dart';

abstract class ProductTapDataSource{
  Future<Either<Failures,ProductEntity>>getProducts();

}