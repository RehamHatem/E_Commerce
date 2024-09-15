import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home_tap/category_entity.dart';
import 'package:e_commerce/domain/repo/data_source/home_tap_data_source.dart';
import 'package:e_commerce/domain/repo/repository/home_tap_repo.dart';

class HomeTapRepositoryImp implements HomeTapRepo{
  HomeTapDataSource homeTapDataSource;
  HomeTapRepositoryImp({required this.homeTapDataSource});
  @override
  Future<Either<Failures, CategoryEntity>> getCategories() async{
    var either = await homeTapDataSource.getCategories();
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    },);
  }

}