part of 'doctor_detail_bloc.dart';

@freezed
class DoctorDetailEvent with _$DoctorDetailEvent {
  const factory DoctorDetailEvent.initialize(DoctorModel doctorModel, SessionSelectedInfo? sessionSelectedInfo) = _Initialize;
  const factory DoctorDetailEvent.getDoctorDetail() = _GetDoctorDetail;
}