// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromJson(jsonString);

import 'dart:convert';

SliderModel sliderModelFromJson(String str) => SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
  SliderModel({
    this.success,
    this.data,
  });

  bool? success;
  Data? data;

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
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
    this.one,
    this.two,
    this.three,
    this.four,
  });

  List<Four>? one;
  List<Four>? two;
  List<Four>? three;
  List<Four>? four;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    one: List<Four>.from(json["one"].map((x) => Four.fromJson(x))),
    two: List<Four>.from(json["two"].map((x) => Four.fromJson(x))),
    three: List<Four>.from(json["three"].map((x) => Four.fromJson(x))),
    four: List<Four>.from(json["four"].map((x) => Four.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "one": List<dynamic>.from(one!.map((x) => x.toJson())),
    "two": List<dynamic>.from(two!.map((x) => x.toJson())),
    "three": List<dynamic>.from(three!.map((x) => x.toJson())),
    "four": List<dynamic>.from(four!.map((x) => x.toJson())),
  };
}

class Four {
  Four({
    this.img,
    this.link,
  });

  String? img;
  String? link;

  factory Four.fromJson(Map<String, dynamic> json) => Four(
    img: json["img"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "img": img,
    "link": link,
  };
}
