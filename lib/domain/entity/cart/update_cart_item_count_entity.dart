import 'cart_entity.dart';

class UpdateCartItemCountEntity {
  UpdateCartItemCountEntity({
      this.status, 
      this.numOfCartItems,
    this.statusMsg,
    this.message,
      this.cartId, 
      this.data,});


  String? status;
  num? numOfCartItems;
  String? statusMsg;
  String? message;
  String? cartId;
  UpdateCartItemCountDataEntity? data;



}

class UpdateCartItemCountDataEntity {
  UpdateCartItemCountDataEntity({
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

