import 'dart:convert';

List<CategoriesModel> categoriesFromJson(String str) =>
    List<CategoriesModel>.from(json.decode(str).map((x)
    => CategoriesModel.fromJson(x)));

class CategoriesModel {
    final String id;
    final String title;
    final String value;
    final String imageUrl;

    CategoriesModel({
        required this.id,
        required this.title,
        required this.value,
        required this.imageUrl,
    });

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        id: json["_id"],
        title: json["title"],
        value: json["value"],
        imageUrl: json["imageUrl"],
    );
}
