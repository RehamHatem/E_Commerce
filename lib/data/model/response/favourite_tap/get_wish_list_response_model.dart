import 'package:e_commerce/domain/entity/favourite_tap/get_wish_list_entity.dart';

import '../product_tap/prosuct_response_model.dart';

class GetWishListResponseModel extends GetWishListEntity {
  GetWishListResponseModel({
      super.status,
    super.count,
    super.message,
    super.statusMsg,
    super.data,});

  GetWishListResponseModel.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataProduct.fromJson(v));
      });
    }
  }




}



