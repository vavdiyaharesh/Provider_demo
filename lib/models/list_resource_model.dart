// To parse this JSON data, do
//
//     final listResourceModel = listResourceModelFromJson(jsonString);

import 'dart:convert';

ListResourceModel listResourceModelFromJson(String str) => ListResourceModel.fromJson(json.decode(str));

String listResourceModelToJson(ListResourceModel data) => json.encode(data.toJson());

class ListResourceModel {
  ListResourceModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<Datum> data;
  Support support;

  factory ListResourceModel.fromJson(Map<String, dynamic> json) => ListResourceModel(
    page: json["page"] == null ? null : json["page"],
    perPage: json["per_page"] == null ? null : json["per_page"],
    total: json["total"] == null ? null : json["total"],
    totalPages: json["total_pages"] == null ? null : json["total_pages"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    support: json["support"] == null ? null : Support.fromJson(json["support"]),
  );

  Map<String, dynamic> toJson() => {
    "page": page == null ? null : page,
    "per_page": perPage == null ? null : perPage,
    "total": total == null ? null : total,
    "total_pages": totalPages == null ? null : totalPages,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "support": support == null ? null : support.toJson(),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.year,
    this.color,
    this.pantoneValue,
  });

  int id;
  String name;
  int year;
  String color;
  String pantoneValue;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    year: json["year"] == null ? null : json["year"],
    color: json["color"] == null ? null : json["color"],
    pantoneValue: json["pantone_value"] == null ? null : json["pantone_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "year": year == null ? null : year,
    "color": color == null ? null : color,
    "pantone_value": pantoneValue == null ? null : pantoneValue,
  };
}

class Support {
  Support({
    this.url,
    this.text,
  });

  String url;
  String text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    url: json["url"] == null ? null : json["url"],
    text: json["text"] == null ? null : json["text"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "text": text == null ? null : text,
  };
}
