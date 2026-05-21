import 'package:ayursh/domain/model/response/book_therapy_date_slot_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_therapy_time_model.g.dart';

@JsonSerializable()
class BookTherapyTimeModel {
  @JsonKey(name: 'appointment_slots')
  final List<BookTherapyDateSlotModel> dateSlots;

  @JsonKey(name: 'user_acceptance_terms_single_session')
  final List<String> singleSessionTerms;

  @JsonKey(name: 'user_acceptance_terms_multi_sessions')
  final List<String> multiSessionTerms;

  BookTherapyTimeModel({
    required this.dateSlots,
    required this.singleSessionTerms,
    required this.multiSessionTerms,
  });

  factory BookTherapyTimeModel.fromJson(Map<String, dynamic> json) =>
      _$BookTherapyTimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookTherapyTimeModelToJson(this);
}