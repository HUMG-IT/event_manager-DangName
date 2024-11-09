import 'dart:ui';

import 'package:event_manager/event/event_mode.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<EventMode> source) {
    appointments = source;
  }
  @override
  DateTime getStartTime(int index) {
    EventMode event = appointments!.elementAt(index);
    return event.startTime;
  }

  @override
  DateTime getEndTime(int index) {
    EventMode event = appointments!.elementAt(index);
    return event.endTime;
  }

  @override
  String getSubject(int index) {
    EventMode event = appointments!.elementAt(index);
    return event.subject;
  }

  @override
  bool isAllDay(int index) {
    EventMode event = appointments!.elementAt(index);
    return event.isAllDay;
  }

  @override
  String? getNotes(int index) {
    EventMode event = appointments!.elementAt(index);
    return event.note;
  }

  @override
  String? getRecurrenceRule(int index) {
    EventMode event = appointments!.elementAt(index);
    return event.recurrenceRule;
  }

  @override
  Color getColor(int index) {
    EventMode event = appointments!.elementAt(index);
    return event.isAllDay ? const Color(0xFF7A9A26) : super.getColor(index);
  }
}
