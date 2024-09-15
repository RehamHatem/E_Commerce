import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/product_tap/product_entity.dart';
import 'package:e_commerce/domain/repo/repository/product_tap_repo.dart';

class ProductTapUseCases {
  ProductTapRepo productTapRepo;
  ProductTapUseCases({required this.productTapRepo});
  Future<Either<Failures,ProductEntity>>getProducts(){
    return productTapRepo.getProducts();

  }
}