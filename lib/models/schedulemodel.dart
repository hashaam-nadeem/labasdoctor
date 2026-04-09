class ScheduleModel {
  final List<MorningSchedule> morningSchedule;
  final List<EveningSchedule> eveningSchedule;

  ScheduleModel({this.morningSchedule, this.eveningSchedule});

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      // withError: json['error'],
      // shortMessage: json['message'],
      eveningSchedule: (json['evening'] as List)
          .map((e) => EveningSchedule.fromJson(e))
          .toList(),
      morningSchedule: (json['morning'] as List)
          .map((e) => MorningSchedule.fromJson(e))
          .toList(),
    );
  }
}

class MorningSchedule {
  int id;
  var day;
  var startTime;
  var endTime;

  MorningSchedule({this.id, this.startTime, this.endTime, this.day});

  factory MorningSchedule.fromJson(Map<String, dynamic> json) {
    return MorningSchedule(
      id: json['id'] ?? 0,
      startTime: json['start_time'] ?? "",
      day: json['day'] ?? "",
      endTime: json['end_time'] ?? "",
    );
  }
}

class EveningSchedule {
  int id;
  var day;
  var startTime;
  var endTime;

  EveningSchedule({this.id, this.startTime, this.endTime, this.day});

  factory EveningSchedule.fromJson(Map<String, dynamic> json) {
    return EveningSchedule(
      id: json['id'] ?? 0,
      startTime: json['start_time'] ?? "",
      day: json['day'] ?? "",
      endTime: json['end_time'] ?? "",
    );
  }
}
