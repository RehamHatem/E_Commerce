import 'package:e_commerce/domain/entity/home_tap/category_brands_entity.dart';

class ProductEntity {
  ProductEntity({
      this.results,
      this.data,});

  num? results;

  List<DataEntity>? data;


}

class DataEntity {
  DataEntity({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 

    });

  num? sold;
  List<String>? images;
  List<CategoryBrandsEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryBrandsEntity? category;
  CategoryBrandsEntity? brand;
  num? ratingsAverage;




}




