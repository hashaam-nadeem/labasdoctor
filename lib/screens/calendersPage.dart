import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:labasDoctor/language/language_constants.dart';

class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  void _handleNewDate(date) {
    setState(() {
      _selectedDay = date;
      _selectedEvents = _events[_selectedDay] ?? [];
    });
    print(_selectedEvents);
  }

  List _selectedEvents;
  DateTime _selectedDay;

  final Map<DateTime, List> _events = {
    DateTime(2021, 1, 4): [
      {'name': 'John Austin', 'isDone': false},
    ],
    DateTime(2021, 1, 9): [
      {'name': 'Jake Paul', 'isDone': false},
      {'name': 'Beckard Shaw', 'isDone': false},
    ],
    DateTime(2021, 1, 5): [
      {'name': 'Helen', 'isDone': false},
      {'name': 'Micheal Bay', 'isDone': false},
    ],
    DateTime(2021, 1, 6): [
      {'name': 'Tom Hardy', 'isDone': false},
      {'name': 'Thomas Shelby', 'isDone': false},
      {'name': 'James Dekkard', 'isDone': false},
    ],
    DateTime(2021, 1, 7): [
      {'name': 'John Doe', 'isDone': false},
      {'name': 'Henry Cavil', 'isDone': false},
      {'name': 'Tony Stark', 'isDone': false},
    ],
    DateTime(2021, 1, 8): [
      {'name': 'Steve Rodgers', 'isDone': false},
    ],
  };

  @override
  void initState() {
    super.initState();
    _selectedEvents = _events[_selectedDay] ?? [];
  }

  final bool isbootomLine = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslated(context, 'AppointmentsSmall'),
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'HelveticaNeue',
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        bottom: PreferredSize(
          child: Container(
            color: isbootomLine
                ? Colors.grey.shade200
                : Theme.of(context).backgroundColor,
            height: 1.0,
          ),
          preferredSize: Size.fromHeight(0.0),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: Calendar(
                  startOnMonday: true,
                  weekDays: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
                  events: _events,
                  onRangeSelected: (range) =>
                      print("Range is ${range.from}, ${range.to}"),
                  onDateSelected: (date) => _handleNewDate(date),
                  isExpandable: true,
                  eventDoneColor: Colors.green,
                  selectedColor: Colors.blue,
                  todayColor: Colors.blue,
                  eventColor: Colors.blue,
                  bottomBarColor: Colors.blue,
                  dayOfWeekStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 11,
                  ),
                  bottomBarTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                  bottomBarArrowColor: Colors.white,
                ),
              ),
              _buildEventList()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.5, color: Colors.black12),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          child: ListTile(
            title: Text(
              _selectedEvents[index]['name'].toString(),
            ),
            onTap: () {},
          ),
        ),
        itemCount: _selectedEvents.length,
      ),
    );
  }
}
