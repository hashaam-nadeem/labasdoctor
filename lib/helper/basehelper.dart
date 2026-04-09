import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:labasDoctor/helper/apimodel.dart';
import 'package:labasDoctor/language/language_constants.dart';
import 'package:labasDoctor/models/UserModel.dart';
import 'package:labasDoctor/models/appointmentmodel.dart';
import 'package:labasDoctor/models/patienthistorymodel.dart';
import 'package:labasDoctor/models/schedulemodel.dart';
import 'dart:convert';

import 'package:labasDoctor/utils/const.dart';

class BASEHELPER {
  Future<dynamic> loginUser(num, pass, context) async {
    var header = {
      'Access-Control-Allow-Origin': "*",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept": "*/*",
      "Accept": "application/json"
      // "Authorization": AuthenticationUser.getbasicauth(),
    };
    try {
      var body = {"mobile": "$num", "password": "$pass"};
      print("body: $body");
      print("header $header");
      print("${API.API_URL}${API.Login}");
      EasyLoading.show();
      final response = await http.post("${API.API_URL}${API.Login}",
          headers: header, body: body);
      var Json = json.decode(response.body);
      print(Json);
      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");
        print(json.decode(response.body));
        EasyLoading.dismiss();
        return Json;
      } else if (response.statusCode == 503) {
        EasyLoading.dismiss();

        constValues()
            .toast("${getTranslated(context, "maintainance")}", context);
      } else if (response.statusCode == 503) {
        EasyLoading.dismiss();

        constValues().toast("Under Maintainence", context);
      } else {
        EasyLoading.dismiss();
        constValues().toast("${response.statusCode}", context);
      }
    } on SocketException {
      constValues().toast("No Internet connection", context);
      EasyLoading.dismiss();
      print('No Internet connection 😑');
    } on HttpException catch (error) {
      print(error);
      constValues().toast("Http Exception", context);
      EasyLoading.dismiss();
      print("Couldn't find the post 😱");
    } on FormatException catch (error) {
      print(error);

      constValues().toast("$error", context);
      EasyLoading.dismiss();
      print("Bad response format 👎");
    } catch (value) {
      constValues().toast("$value", context);
      EasyLoading.dismiss();
      print(value);
    }
  }

  Future<dynamic> sessionHandling(num, pass, context) async {
    var header = {
      'Access-Control-Allow-Origin': "*",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept": "*/*",
      "Accept": "application/json"
      // "Authorization": AuthenticationUser.getbasicauth(),
    };
    try {
      var body = {"mobile": "$num", "password": "$pass"};
      print("body: $body");
      print("header $header");
      print("${API.API_URL}${API.Login}");
      // EasyLoading.show();
      final response = await http.post("${API.API_URL}${API.Login}",
          headers: header, body: body);
      var Json = json.decode(response.body);
      print(Json);
      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");
        print(json.decode(response.body));
        // EasyLoading.dismiss();
        return Json;
      } else if (response.statusCode == 503) {
        // EasyLoading.dismiss();

        constValues()
            .toast("${getTranslated(context, "maintainance")}", context);
      } else if (response.statusCode == 503) {
        EasyLoading.dismiss();

        constValues().toast("Under Maintainence", context);
      } else {
        EasyLoading.dismiss();
        constValues().toast("${response.statusCode}", context);
      }
    } on SocketException {
      constValues().toast("No Internet connection", context);
      EasyLoading.dismiss();
      print('No Internet connection 😑');
    } on HttpException catch (error) {
      print(error);
      constValues().toast("Http Exception", context);
      EasyLoading.dismiss();
      print("Couldn't find the post 😱");
    } on FormatException catch (error) {
      print(error);

      constValues().toast("$error", context);
      EasyLoading.dismiss();
      print("Bad response format 👎");
    } catch (value) {
      constValues().toast("$value", context);
      EasyLoading.dismiss();
      print(value);
    }
  }

  Future<dynamic> requestOTP(num, context) async {
    var header = {
      'Access-Control-Allow-Origin': "*",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept": "*/*",
      "Accept": "application/json"
      // "Authorization": AuthenticationUser.getbasicauth(),
    };
    try {
      var body = {"mobile": "$num"};
      print("body: $body");
      print("header $header");
      print("${API.API_URL}${API.requestOTP}");
      EasyLoading.show();
      final response = await http.post("${API.API_URL}${API.requestOTP}",
          headers: header, body: body);
      var Json = json.decode(response.body);
      print(Json);
      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");
        print(json.decode(response.body));
        EasyLoading.dismiss();
        return Json;
      } else if (response.statusCode == 503) {
        EasyLoading.dismiss();

        constValues().toast("Under Maintainence", context);
      } else {
        return Json;
        EasyLoading.dismiss();
        constValues().toast("${response.statusCode}", context);
      }
    } on SocketException {
      constValues().toast("No Internet connection", context);
      EasyLoading.dismiss();
      print('No Internet connection 😑');
    } on HttpException catch (error) {
      print(error);
      constValues().toast("Http Exception", context);
      EasyLoading.dismiss();
      print("Couldn't find the post 😱");
    } on FormatException catch (error) {
      print(error);

      constValues().toast("$error", context);
      EasyLoading.dismiss();
      print("Bad response format 👎");
    } catch (value) {
      constValues().toast("$value", context);
      EasyLoading.dismiss();
      print(value);
    }
  }

  Future<dynamic> verifyOTP(num, otp, context) async {
    var header = {
      'Access-Control-Allow-Origin': "*",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept": "*/*",
      "Accept": "application/json"
      // "Authorization": AuthenticationUser.getbasicauth(),
    };
    try {
      var body = {"mobile": "$num", "otp": "$otp"};
      print("body: $body");
      print("header $header");
      print("${API.API_URL}${API.verifyOTP}");
      EasyLoading.show();
      final response = await http.post("${API.API_URL}${API.verifyOTP}",
          headers: header, body: body);
      var Json = json.decode(response.body);
      print(Json);
      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");
        print(json.decode(response.body));
        EasyLoading.dismiss();
        return Json;
      } else if (response.statusCode == 503) {
        EasyLoading.dismiss();

        constValues().toast("Under Maintainence", context);
      } else {
        EasyLoading.dismiss();
        constValues().toast("${response.statusCode}", context);
      }
    } on SocketException {
      constValues().toast("No Internet connection", context);
      EasyLoading.dismiss();
      print('No Internet connection 😑');
    } on HttpException catch (error) {
      print(error);
      constValues().toast("Http Exception", context);
      EasyLoading.dismiss();
      print("Couldn't find the post 😱");
    } on FormatException catch (error) {
      print(error);

      constValues().toast("$error", context);
      EasyLoading.dismiss();
      print("Bad response format 👎");
    } catch (value) {
      constValues().toast("$value", context);
      EasyLoading.dismiss();
      print(value);
    }
  }

  Future<dynamic> setPassword(num, otp, pass, context) async {
    var header = {
      'Access-Control-Allow-Origin': "*",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept": "*/*",
      "Accept": "application/json"
      // "Authorization": AuthenticationUser.getbasicauth(),
    };
    try {
      var body = {"mobile": "$num", "otp": "$otp", "password": "$pass"};
      print("body: $body");
      print("header $header");
      print("${API.API_URL}${API.setPassword}");
      EasyLoading.show();
      final response = await http.post("${API.API_URL}${API.setPassword}",
          headers: header, body: body);
      var Json = json.decode(response.body);
      print(Json);
      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");
        print(json.decode(response.body));
        EasyLoading.dismiss();
        return Json;
      } else if (response.statusCode == 503) {
        EasyLoading.dismiss();

        constValues().toast("Under Maintainence", context);
      } else {
        EasyLoading.dismiss();
        constValues().toast("${response.statusCode}", context);
      }
    } on SocketException {
      constValues().toast("No Internet connection", context);
      EasyLoading.dismiss();
      print('No Internet connection 😑');
    } on HttpException catch (error) {
      print(error);
      constValues().toast("Http Exception", context);
      EasyLoading.dismiss();
      print("Couldn't find the post 😱");
    } on FormatException catch (error) {
      print(error);

      constValues().toast("$error", context);
      EasyLoading.dismiss();
      print("Bad response format 👎");
    } catch (value) {
      constValues().toast("$value", context);
      EasyLoading.dismiss();
      print(value);
    }
  }

  Future<List<AppointmentResult>> patientAppointment(date, context) async {
    var header = {
      'Access-Control-Allow-Origin': "*",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept": "*/*",
      "Accept": "application/json",
      'Authorization': 'Bearer ${User.userData.token}',
    };
    try {
      var body = {
        "date": "$date",
      };
      print("body: $body");
      print("header $header");
      print("${API.API_URL}${API.appointments}");
      // EasyLoading.show();
      final response = await http.post("${API.API_URL}${API.appointments}",
          headers: header, body: body);
      var Json = json.decode(response.body);
      print(Json);
      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");
        print(json.decode(response.body));
        // EasyLoading.dismiss();
        if (Json['error'] == false) {
          AppointmentModel appointmentModel = AppointmentModel();
          if (Json['data'] == []) {
            return appointmentModel.result;
          } else {
            appointmentModel = AppointmentModel.fromJson(Json);
            return appointmentModel.result;
          }
        } else {
          constValues().toast("${Json['message']}", context);
        }
      } else if (response.statusCode == 503) {
        EasyLoading.dismiss();

        constValues().toast("Under Maintainence", context);
      } else {
        EasyLoading.dismiss();
        constValues().toast("${response.statusCode}", context);
      }
    } on SocketException {
      constValues().toast("No Internet connection", context);
      EasyLoading.dismiss();
      print('No Internet connection 😑');
    } on HttpException catch (error) {
      print(error);
      constValues().toast("Http Exception", context);
      EasyLoading.dismiss();
      print("Couldn't find the post 😱");
    } on FormatException catch (error) {
      print(error);

      constValues().toast("$error", context);
      EasyLoading.dismiss();
      print("Bad response format 👎");
    } catch (value) {
      constValues().toast("$value", context);
      EasyLoading.dismiss();
      print(value);
    }
  }

  Future<List<PatientResult>> patientHistory(context) async {
    var header = {
      'Access-Control-Allow-Origin': "*",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept": "*/*",
      "Accept": "application/json",
      'Authorization': 'Bearer ${User.userData.token}',
    };
    try {
      print("header $header");
      print("${API.API_URL}${API.patientHistory}");
      // EasyLoading.show();
      final response = await http.post(
        "${API.API_URL}${API.patientHistory}",
        headers: header,
      );
      var Json = json.decode(response.body);
      print(Json);
      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");
        print(json.decode(response.body));
        // EasyLoading.dismiss();
        if (Json['error'] == false) {
          PatientHistoryModel patientHistoryModel = PatientHistoryModel();
          if (Json['data'] == []) {
            return patientHistoryModel.result;
          } else {
            patientHistoryModel = PatientHistoryModel.fromJson(Json);
            return patientHistoryModel.result;
          }
        } else {
          constValues().toast("${Json['message']}", context);
        }
      } else if (response.statusCode == 503) {
        EasyLoading.dismiss();

        constValues().toast("Under Maintainence", context);
      } else {
        EasyLoading.dismiss();
        constValues().toast("${response.statusCode}", context);
      }
    } on SocketException {
      constValues().toast("No Internet connection", context);
      EasyLoading.dismiss();
      print('No Internet connection 😑');
    } on HttpException catch (error) {
      print(error);
      constValues().toast("Http Exception", context);
      EasyLoading.dismiss();
      print("Couldn't find the post 😱");
    } on FormatException catch (error) {
      print(error);

      constValues().toast("$error", context);
      EasyLoading.dismiss();
      print("Bad response format 👎");
    } catch (value) {
      constValues().toast("$value", context);
      EasyLoading.dismiss();
      print(value);
    }
  }

  Future<ScheduleModel> timeSchedule(context) async {
    var header = {
      'Access-Control-Allow-Origin': "*",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept": "*/*",
      "Accept": "application/json",
      'Authorization': 'Bearer ${User.userData.token}',
    };
    try {
      print("header $header");
      print("${API.API_URL}${API.TimeSchedule}");
      // EasyLoading.show();
      final response = await http.post(
        "${API.API_URL}${API.TimeSchedule}",
        headers: header,
      );
      var Json = json.decode(response.body);
      print(Json);
      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");
        print(json.decode(response.body));
        // EasyLoading.dismiss();
        if (Json['error'] == false) {
          ScheduleModel scheduleModel = ScheduleModel();
          if (Json['data'] == []) {
            return scheduleModel;
          } else {
            scheduleModel = ScheduleModel.fromJson(Json);
            return scheduleModel;
          }
        } else {
          constValues().toast("${Json['message']}", context);
        }
      } else if (response.statusCode == 503) {
        EasyLoading.dismiss();

        constValues().toast("Under Maintainence", context);
      } else {
        EasyLoading.dismiss();
        constValues().toast("${response.statusCode}", context);
      }
    } on SocketException {
      constValues().toast("No Internet connection", context);
      EasyLoading.dismiss();
      print('No Internet connection 😑');
    } on HttpException catch (error) {
      print(error);
      constValues().toast("Http Exception", context);
      EasyLoading.dismiss();
      print("Couldn't find the post 😱");
    } on FormatException catch (error) {
      print(error);

      constValues().toast("$error", context);
      EasyLoading.dismiss();
      print("Bad response format 👎");
    } catch (value) {
      constValues().toast("$value", context);
      EasyLoading.dismiss();
      print(value);
    }
  }

  Future<dynamic> applyLeave(morning, evening, date, context) async {
    var header = {
      'Access-Control-Allow-Origin': "*",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept": "*/*",
      "Accept": "application/json",
      'Authorization': 'Bearer ${User.userData.token}',
    };
    try {
      var body = {
        "morning": "$morning",
        "evening": "$evening",
        "date": "$date"
      };
      print("body: $body");
      print("header $header");
      print("${API.API_URL}${API.ApplyLeave}");
      EasyLoading.show();
      final response = await http.post("${API.API_URL}${API.ApplyLeave}",
          headers: header, body: body);
      var Json = json.decode(response.body);
      print(Json);
      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");
        print(json.decode(response.body));
        EasyLoading.dismiss();
        return Json;
      } else if (response.statusCode == 503) {
        EasyLoading.dismiss();

        constValues().toast("Under Maintainence", context);
      } else {
        EasyLoading.dismiss();
        constValues().toast("${response.statusCode}", context);
      }
    } on SocketException {
      constValues().toast("No Internet connection", context);
      EasyLoading.dismiss();
      print('No Internet connection 😑');
    } on HttpException catch (error) {
      print(error);
      constValues().toast("Http Exception", context);
      EasyLoading.dismiss();
      print("Couldn't find the post 😱");
    } on FormatException catch (error) {
      print(error);

      constValues().toast("$error", context);
      EasyLoading.dismiss();
      print("Bad response format 👎");
    } catch (value) {
      constValues().toast("$value", context);
      EasyLoading.dismiss();
      print(value);
    }
  }
}
