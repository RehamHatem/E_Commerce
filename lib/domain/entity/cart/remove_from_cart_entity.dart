
import '../../../data/model/response/product_tap/prosuct_response_model.dart';
import 'cart_entity.dart';

class RemoveFromCartEntity {
  RemoveFromCartEntity({
      this.status,
    this.statusMsg,
    this.message,
      this.numOfCartItems, 
      this.cartId, 
      this.data,});


  String? status;
  num? numOfCartItems;
  String? statusMsg;
  String? message;
  String? cartId;
  RemoveFromCartData? data;



}

class RemoveFromCartData {
  RemoveFromCartData({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});


  String? id;
  String? cartOwner;

  List<RemoveFromCartProducts>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;



}

class RemoveFromCartProducts extends CartProductsEntity{
  RemoveFromCartProducts({
      super.count,
    super.id,
    super.product,
    super.price,});

  



}

class RemoveFromCartProduct extends ProductCartEntity{
  RemoveFromCartProduct({
      super.subcategory,
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage, 
      });






}
