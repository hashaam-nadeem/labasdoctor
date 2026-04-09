import 'package:labasDoctor/models/patienthistorymodel.dart';

class AppointmentModel {
  final bool withError;
  final String shortMessage;
  final List<AppointmentResult> result;

  AppointmentModel({
    this.withError,
    this.result,
    this.shortMessage,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
        // withError: json['error'],
        // shortMessage: json['message'],
        result: (json['data'] as List)
            .map((e) => AppointmentResult.fromJson(e))
            .toList());
  }
}

class AppointmentResult {
  int id;
  var refNo;
  var clientId;
  var departmentId;
  var doctorId;
  var patientId;
  var appointmentDate;
  var startTime;
  var endTime;
  var patientAvailability;
  var appointmentTime;
  var rating;
  var alert;
  PatientProfile patientProfile;
  AppointmentResult(
      {this.id,
      this.alert,
      this.patientProfile,
      this.appointmentDate,
      this.appointmentTime,
      this.clientId,
      this.departmentId,
      this.doctorId,
      this.endTime,
      this.patientAvailability,
      this.patientId,
      this.rating,
      this.refNo,
      this.startTime});

  factory AppointmentResult.fromJson(Map<String, dynamic> json) {
    return AppointmentResult(
      patientProfile: PatientProfile.fromJson(json['patient']),
      id: json['id'] ?? 0,
      refNo: json['ref_no'] ?? "",
      clientId: json['clinic_id'] ?? "",
      departmentId: json['department_id'] ?? "",
      doctorId: json['doctor_id'] ?? "",
      patientId: json['patient_id'] ?? "",
      appointmentDate: json['appointment_date'] ?? "",
      startTime: json['start_time'] ?? "",
      endTime: json['end_time'] ?? "",
      patientAvailability: json['patient_availability'] ?? "",
      appointmentTime: json['appointment_time'] ?? "",
      rating: json['raiting'] ?? "",
      alert: json['alert'] ?? "",
    );
  }
}
