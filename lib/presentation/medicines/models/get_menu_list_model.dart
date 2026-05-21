// To parse this JSON data, do
//
//     final getMenuListModel = getMenuListModelFromJson(jsonString);

import 'dart:convert';

GetMenuListModel getMenuListModelFromJson(String str) => GetMenuListModel.fromJson(json.decode(str));

String getMenuListModelToJson(GetMenuListModel data) => json.encode(data.toJson());

class GetMenuListModel {
  List<Supplier>? suppliers;
  List<Medicine>? medicines;
  List<Medicine>? subCategories;

  GetMenuListModel({
    this.suppliers,
    this.medicines,
    this.subCategories,
  });

  factory GetMenuListModel.fromJson(Map<String, dynamic> json) => GetMenuListModel(
        suppliers: json["suppliers"] == null ? [] : List<Supplier>.from(json["suppliers"]!.map((x) => Supplier.fromJson(x))),
        medicines: json["medicines"] == null ? [] : List<Medicine>.from(json["medicines"]!.map((x) => Medicine.fromJson(x))),
        subCategories: json["sub_categories"] == null ? [] : List<Medicine>.from(json["sub_categories"]!.map((x) => Medicine.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "suppliers": suppliers == null ? [] : List<dynamic>.from(suppliers!.map((x) => x.toJson())),
        "medicines": medicines == null ? [] : List<dynamic>.from(medicines!.map((x) => x.toJson())),
        "sub_categories": subCategories == null ? [] : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
      };
}

class Medicine {
  int? id;
  String? subCategoryTitle;

  Medicine({
    this.id,
    this.subCategoryTitle,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        id: json["id"],
        subCategoryTitle: json["sub_category_title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sub_category_title": subCategoryTitle,
      };
}

class Supplier {
  int? id;
  String? shopname;

  Supplier({
    this.id,
    this.shopname,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        id: json["id"],
        shopname: json["shopname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shopname": shopname,
      };
}
