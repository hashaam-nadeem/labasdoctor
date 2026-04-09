class PatientHistoryModel {
  final bool withError;
  final String shortMessage;
  final List<PatientResult> result;

  PatientHistoryModel({
    this.withError,
    this.result,
    this.shortMessage,
  });

  factory PatientHistoryModel.fromJson(Map<String, dynamic> json) {
    return PatientHistoryModel(
        // withError: json['error'],
        // shortMessage: json['message'],
        result: (json['data'] as List)
            .map((e) => PatientResult.fromJson(e))
            .toList());
  }
}

class PatientResult {
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
  Rating ratting;
  PatientResult(
      {this.id,
      this.alert,
      this.ratting,
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
      this.startTime,
      this.patientProfile});

  factory PatientResult.fromJson(Map<String, dynamic> json) {
    return PatientResult(
      patientProfile: PatientProfile.fromJson(json['patient']),
      ratting: Rating.fromJson(json['raiting']),
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

class PatientProfile {
  var id;
  var name;
  var address;
  var age;
  var mobile;

  PatientProfile({this.address, this.age, this.id, this.name, this.mobile});
  factory PatientProfile.fromJson(Map<String, dynamic> json) {
    return PatientProfile(
      id: json['id'] ?? "",
      address: json['address'] ?? "",
      name: json['name'] ?? "",
      mobile: json['mobile'] ?? "",
      age: json['age'] ?? "",
    );
  }
}

class Rating {
  var id;
  var doctorRating;

  Rating({this.id, this.doctorRating});
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['id'] ?? "",
      doctorRating: json['doctor_raiting'] ?? 0.0,
    );
  }
}
