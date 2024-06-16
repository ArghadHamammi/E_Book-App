class CategoriesModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['genre'];
    categoriesNameAr = json['genre_ar'];
    categoriesImage = json['genre_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories_id'] = categoriesId;
    data['genre'] = categoriesName;
    data['genre_ar'] = categoriesNameAr;
    data['genre_image'] = categoriesImage;
    return data;
  }
}
