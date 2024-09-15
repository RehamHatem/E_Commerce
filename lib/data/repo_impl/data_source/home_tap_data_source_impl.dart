import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/data/api.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home_tap/category_brands_entity.dart';
import 'package:e_commerce/domain/repo/data_source/home_tap_data_source.dart';

class HomeTapDataSourceImpl implements HomeTapDataSource{
   var apiManeger=ApiManeger.instance();
  HomeTapDataSourceImpl({required this.apiManeger});

  @override
  Future<Either<Failures, CategoryBrandsEntity>> getCategories() async{
    var either= await apiManeger.getCategories();
    return either.fold((l) {
      return left(l);
    }, (r) {
     return right(r);
    },);
  }

  @override
  Future<Either<Failures, CategoryBrandsEntity>> getBrands() async{
    var either= await apiManeger.getBrands();
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    },);
  }

}