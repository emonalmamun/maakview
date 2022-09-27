// To parse this JSON data, do
//
//     final popularModel = popularModelFromJson(jsonString);

import 'dart:convert';

PopularCatModel popularModelFromJson(String str) => PopularCatModel.fromJson(json.decode(str));

String popularModelToJson(PopularCatModel data) => json.encode(data.toJson());

class PopularCatModel {
  PopularCatModel({
    this.success,
    this.data,
  });

  bool? success;
  Data? data;

  factory PopularCatModel.fromJson(Map<String, dynamic> json) => PopularCatModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.data,
  });

  List<PopularCat>? data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<PopularCat>.from(json["data"].map((x) => PopularCat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PopularCat {
  PopularCat({
    this.id,
    this.name,
    this.banner,
    this.icon,
    this.slug,
  });

  int? id;
  String? name;
  String? banner;
  String? icon;
  String? slug;

  factory PopularCat.fromJson(Map<String, dynamic> json) => PopularCat(
    id: json["id"],
    name: json["name"],
    banner: json["banner"],
    icon: json["icon"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "banner": banner,
    "icon": icon,
    "slug": slug,
  };
}
