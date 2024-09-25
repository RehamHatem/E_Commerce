import 'package:e_commerce/domain/entity/favourite_tap/remove_from_wish_list_enitit.dart';

class RemoveFromWishListResponseModel extends RemoveFromWishListEnitit {
  RemoveFromWishListResponseModel({
      super.status,
    super.message,
  super.statusMsg,
    super.data,});

  RemoveFromWishListResponseModel.fromJson(dynamic json) {
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