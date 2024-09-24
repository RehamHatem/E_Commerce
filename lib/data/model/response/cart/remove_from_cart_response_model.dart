import 'package:e_commerce/domain/entity/cart/remove_from_cart_entity.dart';

import '../product_tap/prosuct_response_model.dart';

class RemoveFromCartResponseModel extends RemoveFromCartEntity{
  RemoveFromCartResponseModel({
      super.status,
    super.statusMsg,
    super.message,
    super.numOfCartItems,
    super.cartId,
    super.data,});

  RemoveFromCartResponseModel.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    cartId = json['cartId'];
    data = json['data'] != null ? RemoveFromCartDataModel.fromJson(json['data']) : null;
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

class RemoveFromCartDataModel extends RemoveFromCartData{
  RemoveFromCartDataModel({
      super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,});

  RemoveFromCartDataModel.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(RemoveFromCartProductsModel.fromJson(v));
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

class RemoveFromCartProductsModel extends RemoveFromCartProducts {
  RemoveFromCartProductsModel({
      super.count,
    super.id,
    super.product,
    super.price,});

  RemoveFromCartProductsModel.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null ? RemoveFromCartProductModel.fromJson(json['product']) : null;
    price = json['price'];
  }

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['count'] = count;
  //   map['_id'] = id;
  //   if (product != null) {
  //     map['product'] = product?.toJson();
  //   }
  //   map['price'] = price;
  //   return map;
  // }

}

class RemoveFromCartProductModel extends RemoveFromCartProduct{
  RemoveFromCartProductModel({
    super.subcategory,
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
      });

  RemoveFromCartProductModel.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (subcategory != null) {
      map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
    }
    map['_id'] = id;
    map['title'] = title;
    map['quantity'] = quantity;
    map['imageCover'] = imageCover;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    map['id'] = id;
    return map;
  }

}

