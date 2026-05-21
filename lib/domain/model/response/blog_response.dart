import 'package:ayursh/domain/model/response/blog_model.dart';
import 'package:ayursh/domain/model/response/otp_token_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_response.g.dart';

@JsonSerializable()
class BlogResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final List<BlogModel>? blogs;


  BlogResponse(
      this.success, this.errorCode, this.message, this.blogs);

  factory BlogResponse.fromJson(Map<String, dynamic> json) => _$BlogResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BlogResponseToJson(this);
}