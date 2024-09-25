import '../product_tap/product_entity.dart';

class GetWishListEntity {
  GetWishListEntity({
      this.status, 
      this.count,
    this.statusMsg,
    this.message,
      this.data,});


  String? status;
  num? count;
  String? statusMsg;
  String? message;
  List<DataEntity>? data;



}



