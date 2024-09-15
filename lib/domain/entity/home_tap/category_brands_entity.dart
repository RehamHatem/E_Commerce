class CategoryBrandsEntity {
  CategoryBrandsEntity({
      this.results,
      this.data,});

  int? results;
  List<DataCategoryBrandsEntity>? data;

}

class DataCategoryBrandsEntity {
  DataCategoryBrandsEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 
    });

  String? id;
  String? name;
  String? slug;
  String? image;



}

