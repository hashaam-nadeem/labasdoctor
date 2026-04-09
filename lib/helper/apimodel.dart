class API {
  static const String API_URL = "http://labasonline.com";
  //  "http://labas.brightmediaqa.com";
  //"http://192.168.18.32"
  //"http://3.135.23.7";

  static const String Image_Path =
      "https://driverqtr.com/uploads/reseller/normal/";
  /*------------------------------------------------------------
                 API:Login
                 TYPE: post  -------------------------------------------------------------*/
  static const Login = "/api/doctor/login";

  /*------------------------------------------------------------
                 API:Login
                 TYPE: post  -------------------------------------------------------------*/
  static const requestOTP = "/api/doctor/password/reset/request";
  /*------------------------------------------------------------
                 API:Login
                 TYPE: post  -------------------------------------------------------------*/
  static const verifyOTP = "/api/doctor/password/reset/verify/otp";
  /*------------------------------------------------------------
                 API:Login
                 TYPE: post  -------------------------------------------------------------*/
  static const setPassword = "/api/doctor/password/reset";

  /*------------------------------------------------------------
                 API:Login
                 TYPE: post  -------------------------------------------------------------*/
  static const appointments = "/api/doctor/appointments";

  /*------------------------------------------------------------
                 API:Login
                 TYPE: post  -------------------------------------------------------------*/
  static const patientHistory = "/api/doctor/patients/history";

  /*------------------------------------------------------------
                 API:Login
                 TYPE: post  -------------------------------------------------------------*/
  static const TimeSchedule = "/api/doctor/time/schedule";

  /*------------------------------------------------------------
                 API:Login
                 TYPE: post  -------------------------------------------------------------*/
  static const ApplyLeave = "/api/doctor/leave";
}
