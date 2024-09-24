import 'package:e_commerce/domain/entity/product_tap/add_to_cart_entity.dart';

import '../../../data/model/response/product_tap/prosuct_response_model.dart';

class CartEntity {
  CartEntity({
      this.status, 
      this.message,
      this.statusMsg,
      this.numOfCartItems,
      this.cartId, 
      this.data,});


  String? status;
  String? message;
  String? statusMsg;
  num? numOfCartItems;
  String? cartId;
  CartDataEntity? data;



}

class CartDataEntity  {
  CartDataEntity({
      this.id, 
      this.cartOwner, 
      this.products,
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});


  String? id;
  String? cartOwner;
  List<CartProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;



}

class CartProductsEntity {
  CartProductsEntity({
      this.count,
      this.id,
      this.product,
      this.price,});


  num? count;
  String? id;
  ProductCartEntity? product;
  num? price;



}

class ProductCartEntity {
  ProductCartEntity({
      this.subcategory,
      this.id,
      this.title,
      this.quantity,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage,
      });


  List<Subcategory>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  Category? category;
  Brand? brand;
  num? ratingsAverage;


}
