class CategoryEntity {
  CategoryEntity({
      this.results,
      this.data,});

  int? results;
  List<DataEntity>? data;

}

class DataEntity {
  DataEntity({
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

