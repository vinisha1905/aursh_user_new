import 'package:ayursh/domain/model/response/user_review_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_review_response.g.dart';

@JsonSerializable()
class UserReviewResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String errorCode;
  final String message;
  @JsonKey(name: 'data')
  final List<UserReviewModel>? reviews;


  UserReviewResponse(this.success, this.errorCode, this.message, this.reviews);

  factory UserReviewResponse.fromJson(Map<String, dynamic> json) => _$UserReviewResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserReviewResponseToJson(this);
}