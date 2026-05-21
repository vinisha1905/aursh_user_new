import 'package:ayursh/domain/model/response/appointment_slot_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_appointment_model.g.dart';

@JsonSerializable()
class BookAppointmentModel {
  @JsonKey(name: 'appointment_slots')
  final List<AppointmentSlotModel> appointmentSlots;

  BookAppointmentModel(this.appointmentSlots);

  factory BookAppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$BookAppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookAppointmentModelToJson(this);
}
