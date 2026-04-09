import 'package:labasDoctor/models/date_model.dart';
import 'package:labasDoctor/models/notificationModel.dart';

String dummyProfilePic =
    "https://clinicalnotebook.com/wp-content/uploads/2015/04/Doctor-Profile-Pic-Example.png";

final List<NotificationModel> notifications = [
  NotificationModel(
    userName: 'David Brooks',
    description: 'Appointment at 9:30 AM Tomorrow',
    userImage:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  NotificationModel(
    userName: 'John Doe',
    description: 'Appointment at 10:30 AM Tomorrow',
    userImage:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  NotificationModel(
    userName: 'Barack Obama',
    description: 'Appointment at 9:30 AM on Wednesday',
    userImage:
        'https://www.biography.com/.image/t_share/MTE4MDAzNDEwNzg5ODI4MTEw/barack-obama-12782369-1-402.jpg',
  ),
  NotificationModel(
    userName: 'David Houston',
    description: 'Appointment at 10:30 AM on Wednesday',
    userImage:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  NotificationModel(
    userName: 'Michelle Kelly',
    description: 'Appointment at 11:30 AM on Wednesday',
    userImage:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  NotificationModel(
    userName: 'Jake Brooks',
    description: 'Appointment at 12:30 AM on Thursday',
    userImage:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  NotificationModel(
    userName: 'James Underwood',
    description: 'Appointment at 10:30 AM on Firday',
    userImage:
        'https://www.rfid-wiot-search.com/images/contacts/Athanasios-Koutsouridis_Bressner.jpg',
  ),
  NotificationModel(
    userName: 'Jake Paul',
    description: 'Appointment at 11:30 AM on Friday',
    userImage:
        'https://www.printaction.com/images/stories/headshots/warrenwerbitt.jpg',
  ),
];

List<DateModel> getDates() {
  List<DateModel> dates = new List<DateModel>();
  DateModel dateModel = new DateModel();

  //1
  dateModel.date = "10";
  dateModel.weekDay = "Sun";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "11";
  dateModel.weekDay = "Mon";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "12";
  dateModel.weekDay = "Tue";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "13";
  dateModel.weekDay = "Wed";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "14";
  dateModel.weekDay = "Thu";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "15";
  dateModel.weekDay = "Fri";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "16";
  dateModel.weekDay = "Sat";
  dates.add(dateModel);

  dateModel = new DateModel();

  return dates;
}

final List<NotificationModel> todayAppointments = [
  NotificationModel(
    userName: 'David Brooks',
    time: '9:30',
    description: 'Appointment at 9:30 AM Tomorrow',
    userImage:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  NotificationModel(
    userName: 'John Doe',
    time: '10:00',
    description: 'Appointment at 10:30 AM Tomorrow',
    userImage:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  NotificationModel(
    userName: 'David Houston',
    time: '10:30',
    description: 'Appointment at 10:30 AM on Wednesday',
    userImage:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  NotificationModel(
    userName: 'Michelle Kelly',
    time: '11:00',
    description: 'Appointment at 11:30 AM on Wednesday',
    userImage:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  NotificationModel(
    userName: 'Jake Brooks',
    time: '11:30',
    description: 'Appointment at 12:30 AM on Thursday',
    userImage:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  NotificationModel(
    userName: 'James Underwood',
    time: '12:00',
    description: 'Appointment at 10:30 AM on Firday',
    userImage:
        'https://www.rfid-wiot-search.com/images/contacts/Athanasios-Koutsouridis_Bressner.jpg',
  ),
];
