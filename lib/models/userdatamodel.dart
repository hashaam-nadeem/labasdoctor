class UserDataModel {
  final UserResult result;

  UserDataModel({
    this.result,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      result: UserResult.fromJson(json),
    );
  }
}

class UserResult {
  int id;
  var clinicId;
  var departmentId;
  var timePatient;
  var name;
  var arabicName;
  var mobile;
  var education;
  var services;
  var specilization;
  var experience;
  var longDes;
  var shortDes;
  var image;
  var rating;
  UserResult(
      {this.arabicName,
      this.clinicId,
      this.departmentId,
      this.education,
      this.experience,
      this.id,
      this.image,
      this.longDes,
      this.mobile,
      this.name,
      this.rating,
      this.services,
      this.shortDes,
      this.specilization,
      this.timePatient});

  factory UserResult.fromJson(Map<String, dynamic> json) {
    return UserResult(
      id: json['id'],
      clinicId: json['clinic_id'] ?? "",
      departmentId: json['department_id'] ?? "",
      timePatient: json['time_per_patient'] ?? "",
      name: json['name'] ?? "",
      arabicName: json['arabic_name'] ?? "",
      mobile: json['mobile'] ?? "",
      education: json['education'],
      services: json['services'] ?? "",
      specilization: json['specialization'] ?? "",
      experience: json['experience'] ?? "",
      longDes: json['long_description'] ?? "",
      shortDes: json['short_description'],
      image: json['image_path'] ?? "",
      rating: json['averagerating'] ?? "",
    );
  }
}
