import 'package:e_commerce/domain/entity/product_tap/add_to_cart_entity.dart';

class AddToCartResponseModel extends AddToCartEntity {
  AddToCartResponseModel({
      super.status,
    super.statusMsg,
    super.message,
    super.numOfCartItems,
    super.cartId,
      this.dataa,});

  AddToCartResponseModel.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddToCartDataModel.fromJson(json['data']) : null;
  }

  AddToCartDataModel? dataa;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    map['cartId'] = cartId;
    if (data != null) {
      map['data'] = dataa?.toJson();
    }
    return map;
  }

}

class AddToCartDataModel extends AddToCartDataEntity {
  AddToCartDataModel({
    super.id,
    super.cartOwner,
    this.productss,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,});

  AddToCartDataModel.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddToCartProducts.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  List<AddToCartProducts>? productss;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (products != null) {
      map['products'] = productss?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }

}

class AddToCartProducts extends AddToCartProductsEntity{
  AddToCartProducts({
    super.count,
    super.id,
    super.product,
    super.price,});

  AddToCartProducts.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }

}