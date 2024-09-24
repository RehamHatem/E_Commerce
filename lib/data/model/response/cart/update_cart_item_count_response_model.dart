import 'package:e_commerce/domain/entity/cart/update_cart_item_count_entity.dart';

import 'cart_screen_response_model.dart';

class UpdateCartItemCountResponseModel extends UpdateCartItemCountEntity {
  UpdateCartItemCountResponseModel({
      super.status,
    super.numOfCartItems,
    super.statusMsg,
    super.message,
    super.cartId,
    super.data,});

  UpdateCartItemCountResponseModel.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    cartId = json['cartId'];
    data = json['data'] != null ? UpdateCartItemCountDataModel.fromJson(json['data']) : null;
  }


  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['status'] = status;
  //   map['numOfCartItems'] = numOfCartItems;
  //   map['cartId'] = cartId;
  //   if (data != null) {
  //     map['data'] = data?.toJson();
  //   }
  //   return map;
  // }

}

class UpdateCartItemCountDataModel extends UpdateCartItemCountDataEntity {
  UpdateCartItemCountDataModel({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,});

  UpdateCartItemCountDataModel.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(CartProductsmodel.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }


  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['_id'] = id;
  //   map['cartOwner'] = cartOwner;
  //   if (products != null) {
  //     map['products'] = products?.map((v) => v.toJson()).toList();
  //   }
  //   map['createdAt'] = createdAt;
  //   map['updatedAt'] = updatedAt;
  //   map['__v'] = v;
  //   map['totalCartPrice'] = totalCartPrice;
  //   return map;
  // }

}

