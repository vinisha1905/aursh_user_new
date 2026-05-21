import 'package:json_annotation/json_annotation.dart';

part 'therapy_note_model.g.dart';

@JsonSerializable()
class TherapyNoteModel {
  @JsonKey(name: 'payment_for')
  final String paymentFor;
  @JsonKey(name: 'therapy_booking_id')
  final String therapyBookingId;

  TherapyNoteModel(this.paymentFor, this.therapyBookingId);

  factory TherapyNoteModel.fromJson(Map<String, dynamic> json) =>
      _$TherapyNoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$TherapyNoteModelToJson(this);
}
