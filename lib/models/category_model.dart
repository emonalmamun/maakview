// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.data,
    this.success,
    this.status,
  });

  List<Data>? data;
  bool? success;
  int? status;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class Children {
  Children({
    this.data,
  });

  List<Data>? data;

  factory Children.fromJson(Map<String, dynamic> json) => Children(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    this.name,
    this.banner,
    this.icon,
    this.slug,
    this.children,
    this.id,
  });

  String? name;
  String? banner;
  String? icon;
  String? slug;
  Children? children;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    banner: json["banner"],
    icon: json["icon"],
    slug: json["slug"],
    children: json["children"] == null ? null : Children.fromJson(json["children"]),
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "banner": banner,
    "icon": icon,
    "slug": slug,
    "children": children == null ? null : children!.toJson(),
    "id": id == null ? null : id,
  };
}
