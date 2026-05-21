import 'package:json_annotation/json_annotation.dart';

part 'user_review_model.g.dart';

@JsonSerializable()
class UserReviewModel {
  @JsonKey(name: 'user_name')
  final String userName;
  @JsonKey(name: 'user_review')
  final String userReview;
  @JsonKey(name: 'user_image_url')
  final String userImageUrl;


  UserReviewModel(this.userName, this.userReview, this.userImageUrl);

  factory UserReviewModel.fromJson(Map<String, dynamic> json) => _$UserReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserReviewModelToJson(this);
}