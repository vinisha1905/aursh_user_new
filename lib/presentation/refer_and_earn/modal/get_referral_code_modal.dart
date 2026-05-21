import 'dart:convert';

GetReferralTextModal getReferralTextFromJson(String str) =>
    GetReferralTextModal.fromJson(json.decode(str));

String getReferralTextToJson(GetReferralTextModal data) =>
    json.encode(data.toJson());

class GetReferralTextModal {
  bool? success;
  String? errorCode;
  String? message;
  ReferralTextData? data;

  GetReferralTextModal({this.success, this.errorCode, this.message, this.data});

  GetReferralTextModal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['error_code'];
    message = json['message'];
    data = json['data'] != null
        ? new ReferralTextData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error_code'] = this.errorCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ReferralTextData {
  int? referrerCommission;
  int? referralDiscount;
  String? referralCode;
  List<String>? referralText;

  ReferralTextData(
      {this.referrerCommission,
      this.referralDiscount,
      this.referralText,
      this.referralCode});

  ReferralTextData.fromJson(Map<String, dynamic> json) {
    referrerCommission = json['referrer_commission'];
    referralDiscount = json['referral_discount'];
    referralCode = json['referral_code'];
    referralText = json['referral_text'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['referrer_commission'] = this.referrerCommission;
    data['referral_discount'] = this.referralDiscount;
    data['referral_text'] = this.referralText;
    data['referral_code'] = this.referralCode;
    return data;
  }
}
