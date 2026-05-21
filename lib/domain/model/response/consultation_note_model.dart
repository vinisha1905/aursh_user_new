import 'package:json_annotation/json_annotation.dart';

part 'consultation_note_model.g.dart';

@JsonSerializable()
class ConsultationNoteModel {
  @JsonKey(name: 'payment_for')
  final String paymentFor;
  @JsonKey(name: 'consultation_booking_id')
  final String consultationBookingId;

  ConsultationNoteModel(this.paymentFor, this.consultationBookingId);

  factory ConsultationNoteModel.fromJson(Map<String, dynamic> json) =>
      _$ConsultationNoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationNoteModelToJson(this);
}
