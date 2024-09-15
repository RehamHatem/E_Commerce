import 'package:e_commerce/domain/entity/home_tap/category_brands_entity.dart';

class BrandsResponseModel extends CategoryBrandsEntity{
  BrandsResponseModel({
      super.results,
      this.metadata,
    this.message,
    this.statusmessage,
    super.data,});

  BrandsResponseModel.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusmessage = json['statusMsg'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  Metadata? metadata;

  String? message;
  String? statusmessage;



}

class Data extends DataCategoryBrandsEntity {
  Data({
     super.id,
    super.name,
      super.slug,
      super.image,
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}

class Metadata {
  Metadata({
      this.currentPage, 
      this.numberOfPages, 
      this.limit, 
      this.nextPage,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    map['nextPage'] = nextPage;
    return map;
  }

}