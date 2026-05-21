// To parse this JSON data, do
//
//     final medicineBookingModel = medicineBookingModelFromJson(jsonString);

import 'dart:convert';

List<MedicineBookingModel> medicineBookingModelFromJson(String str) => List<MedicineBookingModel>.from(json.decode(str).map((x) => MedicineBookingModel.fromJson(x)));

String medicineBookingModelToJson(List<MedicineBookingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicineBookingModel {
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

  MedicineBookingModel({
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

  factory MedicineBookingModel.fromJson(Map<String, dynamic> json) => MedicineBookingModel(
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


  static List<MedicineBookingModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => MedicineBookingModel.fromJson(json)).toList();
  }
}
