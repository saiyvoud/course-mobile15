import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

class CategoryModel {
  final String? id;
  final String? title;

  CategoryModel({
    this.id,
    this.title,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["_id"],
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
