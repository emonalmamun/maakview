// To parse this JSON data, do
//
//     final offerModel = offerModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

OfferModel offerModelFromJson(String str) => OfferModel.fromJson(json.decode(str));

String offerModelToJson(OfferModel data) => json.encode(data.toJson());

class OfferModel {
  OfferModel({
    this.data,
    this.success,
    this.status,
  });

  List<Offer>? data;
  bool? success;
  int? status;

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
    data: List<Offer>.from(json["data"].map((x) => Offer.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class Offer {
  Offer({
    this.title,
    this.slug,
    this.banner,
    this.startDate,
    this.endDate,
  });

  String? title;
  String? slug;
  String? banner;
  String? startDate;
  String? endDate;

  //String get startDateFormatted => DateFormat.yMMMEd().format(startDate);

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    title: json["title"],
    slug: json["slug"],
    banner: json["banner"],
    startDate: json["start_date"],
    endDate: json["end_date"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "slug": slug,
    "banner": banner,
    "start_date": startDate,
    "end_date": endDate,
  };
}
