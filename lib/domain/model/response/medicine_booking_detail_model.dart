// To parse this JSON data, do
//
//     final medicineBookingDetailModel = medicineBookingDetailModelFromJson(jsonString);

import 'dart:convert';

MedicineBookingDetailModel medicineBookingDetailModelFromJson(String str) => MedicineBookingDetailModel.fromJson(json.decode(str));

String medicineBookingDetailModelToJson(MedicineBookingDetailModel data) => json.encode(data.toJson());

class MedicineBookingDetailModel {
  Order? order;
  List<Product>? product;
  bool? success;

  MedicineBookingDetailModel({
    this.order,
    this.product,
    this.success,
  });

  factory MedicineBookingDetailModel.fromJson(Map<String, dynamic> json) => MedicineBookingDetailModel(
    order: json["order"] == null ? null : Order.fromJson(json["order"]),
    product: json["product"] == null ? [] : List<Product>.from(json["product"]!.map((x) => Product.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "order": order?.toJson(),
    "product": product == null ? [] : List<dynamic>.from(product!.map((x) => x.toJson())),
    "success": success,
  };
}

class Order {
  int? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? address;
  String? postalCode;
  String? city;
  int? deliveryPrice;
  int? totalPrice;
  DateTime? created;
  int? totalMedicinePrice;

  Order({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.address,
    this.postalCode,
    this.city,
    this.deliveryPrice,
    this.totalPrice,
    this.created,
    this.totalMedicinePrice,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    userId: json["user_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    mobile: json["mobile"],
    address: json["address"],
    postalCode: json["postal_code"],
    city: json["city"],
    deliveryPrice: json["delivery_price"],
    totalPrice: json["total_price"],
    created: json["created"] == null ? null : DateTime.parse(json["created"]),
    totalMedicinePrice: json["total_medicine_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "mobile": mobile,
    "address": address,
    "postal_code": postalCode,
    "city": city,
    "delivery_price": deliveryPrice,
    "total_price": totalPrice,
    "created": created?.toIso8601String(),
    "total_medicine_price": totalMedicinePrice,
  };
}

class Product {
  int? id;
  String? name;
  String? photo;
  int? price;
  int? orderPrice;
  int? orderQuantity;

  Product({
    this.id,
    this.name,
    this.photo,
    this.price,
    this.orderPrice,
    this.orderQuantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    photo: json["photo"],
    price: json["price"],
    orderPrice: json["order_price"],
    orderQuantity: json["order_quantity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "photo": photo,
    "price": price,
    "order_price": orderPrice,
    "order_quantity": orderQuantity,
  };
}
