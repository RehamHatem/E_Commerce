import 'package:e_commerce/domain/entity/favourite_tap/add_product_to_wish_list_entity.dart';

class AddProductToWishListResponseModel extends AddProductToWishListEntity {
  AddProductToWishListResponseModel({
      super.status,
      super.statusMsg,
      super.message,
      super.data,});

  AddProductToWishListResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}