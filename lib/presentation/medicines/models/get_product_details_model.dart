// To parse this JSON data, do
//
//     final getProductDetailsModel = getProductDetailsModelFromJson(jsonString);

import 'dart:convert';

GetProductDetailsModel getProductDetailsModelFromJson(String str) => GetProductDetailsModel.fromJson(json.decode(str));

String getProductDetailsModelToJson(GetProductDetailsModel data) => json.encode(data.toJson());

class GetProductDetailsModel {
  int? id;
  String? name;
  int? category;
  int? supplier;
  String? photo;
  int? price;
  String? shortDescription;
  String? longDescription;
  int? quantity;
  String? pkg;
  String? mainImage;
  String? childImages;
  String? ingredients;
  String? subCategory;

  GetProductDetailsModel({
    this.id,
    this.name,
    this.category,
    this.supplier,
    this.photo,
    this.price,
    this.shortDescription,
    this.longDescription,
    this.quantity,
    this.pkg,
    this.mainImage,
    this.childImages,
    this.ingredients,
    this.subCategory,
  });

  factory GetProductDetailsModel.fromJson(Map<String, dynamic> json) => GetProductDetailsModel(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        supplier: json["supplier"],
        photo: json["photo"],
        price: json["price"],
        shortDescription: json["short_description"],
        longDescription: json["long_description"],
        quantity: json["quantity"],
        pkg: json["pkg"],
        mainImage: json["main_image"],
        childImages: json["child_images"],
        ingredients: json["ingredients"],
        subCategory: json["sub_category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "supplier": supplier,
        "photo": photo,
        "price": price,
        "short_description": shortDescription,
        "long_description": longDescription,
        "quantity": quantity,
        "pkg": pkg,
        "main_image": mainImage,
        "child_images": childImages,
        "ingredients": ingredients,
        "sub_category": subCategory,
      };
}
