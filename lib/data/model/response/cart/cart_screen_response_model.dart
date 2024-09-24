import 'package:e_commerce/domain/entity/cart/cart_entity.dart';

import '../product_tap/prosuct_response_model.dart';

class CartScreenResponseModel extends CartEntity {
  CartScreenResponseModel({
      super.status,
    super.statusMsg,
    super.numOfCartItems,
    super.cartId,
      this.dataa,});

  CartScreenResponseModel.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? CartDataModel.fromJson(json['data']) : null;
    dataa = json['data'] != null ? CartDataModel.fromJson(json['data']) : null;
  }

  CartDataModel? dataa;



}

class CartDataModel extends CartDataEntity{
  CartDataModel({
      super.id,
    super.cartOwner,
    super.products,
      // this.productss,
      super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,});

  CartDataModel.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(CartProductsmodel.fromJson(v));
      });
    }
    // if (json['products'] != null) {
    //   productss = [];
    //   json['products'].forEach((v) {
    //     productss?.add(CartProductsmodel.fromJson(v));
    //   });
    // }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  // List<CartProductsmodel>? productss;




}

class CartProductsmodel extends CartProductsEntity {
  CartProductsmodel({
      super.count,
    super.id,
    super.product,
      // this.productt,
    super.price,});

  CartProductsmodel.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
product = json['product'] != null ? Product.fromJson(json['product']) : null;
     price = json['price'];
    // productt = json['product'] != null ? Product.fromJson(json['product']) : null;
    // price = json['price'];
  }

  // Product? productt;


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

class Product extends ProductCartEntity  {
  Product({
      super.subcategory,
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
      });

  Product.fromJson(dynamic json) {
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

