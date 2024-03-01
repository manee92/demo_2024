import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MonthScreen extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const MonthScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MonthScreenState createState() => _MonthScreenState();
}

class _MonthScreenState extends State<MonthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCalendar(
      view: CalendarView.month,
      showNavigationArrow: true,
      showDatePickerButton:true,
      cellBorderColor: Colors.transparent,
      backgroundColor: Colors.white,
      initialSelectedDate: DateTime.now(),
      viewHeaderStyle: const ViewHeaderStyle(
        dayTextStyle: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      monthViewSettings: const MonthViewSettings(
        showAgenda: true,
        dayFormat: 'EEE',
        agendaViewHeight: 70,
        appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
        agendaItemHeight: 70,
        appointmentDisplayCount: 10,
        agendaStyle: AgendaStyle(
          dayTextStyle: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
          appointmentTextStyle: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
          headerStyle: const CalendarHeaderStyle(
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.purple)
          ),
      dataSource: MeetingDataSource(_getDataSource()),
      // monthViewSettings: const MonthViewSettings(
      //     appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
    ));
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime,  Colors.purple, false));
    return meetings;
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
