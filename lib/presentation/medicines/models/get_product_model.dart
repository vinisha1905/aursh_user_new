// To parse this JSON data, do
//
//     final getProductModel = getProductModelFromJson(jsonString);

import 'dart:convert';

GetProductModel getProductModelFromJson(String str) => GetProductModel.fromJson(json.decode(str));

String getProductModelToJson(GetProductModel data) => json.encode(data.toJson());

class GetProductModel {
  int? count;
  String? next;
  String? previous;
  List<ProductResult>? results;

  GetProductModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory GetProductModel.fromJson(Map<String, dynamic> json) => GetProductModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null ? [] : List<ProductResult>.from(json["results"]!.map((x) => ProductResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class ProductResult {
  int? id;
  String? name;
  int? category;
  int? supplier;
  String? photo;
  int? price;
  String? shortDescription;
  int qty;

  ProductResult({
    this.id,
    this.name,
    this.category,
    this.supplier,
    this.photo,
    this.price,
    this.shortDescription,
    this.qty = 0,
  });

  factory ProductResult.fromJson(Map<String, dynamic> json) => ProductResult(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        supplier: json["supplier"],
        photo: json["photo"],
        price: json["price"],
        shortDescription: json["short_description"],
        qty: json["qty"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "supplier": supplier,
        "photo": photo,
        "price": price,
        "short_description": shortDescription,
        "qty": qty,
      };
}
