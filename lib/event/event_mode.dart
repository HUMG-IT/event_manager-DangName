import 'dart:convert';

import 'package:flutter/widgets.dart';

class EventMode {
  String? id;
  DateTime startTime;
  DateTime endTime;
  bool isAllDay;
  String subject;
  String? note;
  String? recurrenceRule;
  EventMode({
    this.id,
    required this.startTime,
    required this.endTime,
    this.isAllDay = false,
    this.subject = '',
    this.note,
    this.recurrenceRule,
  });

  EventMode copyWith({
    ValueGetter<String?>? id,
    DateTime? startTime,
    DateTime? endTime,
    bool? isAllDay,
    String? subject,
    ValueGetter<String?>? note,
    ValueGetter<String?>? recurrenceRule,
  }) {
    return EventMode(
      id: id != null ? id() : this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isAllDay: isAllDay ?? this.isAllDay,
      subject: subject ?? this.subject,
      note: note != null ? note() : this.note,
      recurrenceRule:
          recurrenceRule != null ? recurrenceRule() : this.recurrenceRule,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'startTime': startTime.millisecondsSinceEpoch,
      'endTime': endTime.millisecondsSinceEpoch,
      'isAllDay': isAllDay,
      'subject': subject,
      'note': note,
      'recurrenceRule': recurrenceRule,
    };
  }

  factory EventMode.fromMap(Map<String, dynamic> map) {
    return EventMode(
      id: map['id'],
      startTime: DateTime.fromMillisecondsSinceEpoch(map['startTime']),
      endTime: DateTime.fromMillisecondsSinceEpoch(map['endTime']),
      isAllDay: map['isAllDay'] ?? false,
      subject: map['subject'] ?? '',
      note: map['note'],
      recurrenceRule: map['recurrenceRule'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EventMode.fromJson(String source) =>
      EventMode.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventMode(id: $id, startTime: $startTime, endTime: $endTime, isAllDay: $isAllDay, subject: $subject, note: $note, recurrenceRule: $recurrenceRule)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventMode &&
        other.id == id &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.isAllDay == isAllDay &&
        other.subject == subject &&
        other.note == note &&
        other.recurrenceRule == recurrenceRule;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        isAllDay.hashCode ^
        subject.hashCode ^
        note.hashCode ^
        recurrenceRule.hashCode;
  }
}

extension ExtEventModel on EventMode {
  String get formatedStartTimeString =>
      '${startTime.hour}:${startTime.minute}, ${startTime.day}/${startTime.month}:${startTime.year}';
  String get formatedEndTimeString =>
      '${endTime.hour}:${endTime.minute}, ${endTime.day}/${endTime.month}:${endTime.year}';
}
