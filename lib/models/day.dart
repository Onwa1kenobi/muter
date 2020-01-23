import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:muter/extensions.dart';

class Day with ChangeNotifier {
  final int id;
  final DayOfWeek _dayOfWeek;
  Mode _mode;
  bool _isActive = false;
  TimeOfDay _startTime;
  TimeOfDay _endTime;

  Day(this.id, this._dayOfWeek);

  String get day => _dayOfWeek.toString().split('.').last;

  String get mode => _mode.toString().split('.').last;

  bool get isActive => _isActive;

  set isActive(bool isActive) {
    _isActive = isActive;
    notifyListeners();
  }

  TimeOfDay get startTime => _startTime;

//  String get startTimeDisplayValue => _startTime;

  set startTime(TimeOfDay startTime) {
    _startTime = startTime;
    notifyListeners();
  }

  TimeOfDay get endTime => _endTime;

  set endTime(TimeOfDay endTime) {
    _endTime = endTime;
    notifyListeners();
  }

  static TimeOfDay _getTimeOfDayFromString(String time) {
    return TimeOfDay(
      hour: time.substring(0, time.indexOf(":")).toInt(),
      minute: time.substring(time.indexOf(":") + 1).toInt()
    );
//    return TimeOfDay.fromDateTime(DateFormat.jm().parse(time));
  }

  static DayOfWeek _getDayOfWeekFromString(String day) {
    return DayOfWeek.values.firstWhere(
        (element) => element.toString() == 'DayOfWeek.' + day.capitalize());
  }

  static Mode _getModeFromString(String mode) {
    return Mode.values.firstWhere(
        (element) => element.toString() == 'Mode.' + mode.capitalize());
  }

  Day.fromJson(Map<String, dynamic> json)
      : id = _getDayOfWeekFromString(json['day']).index,
        _dayOfWeek = _getDayOfWeekFromString(json['day']),
        _mode = _getModeFromString(json['mode']),
        _isActive = json['isActive'],
        _startTime = _getTimeOfDayFromString(json['startTime']),
        _endTime = _getTimeOfDayFromString(json['endTime']);
}

enum DayOfWeek {
  Sunday,
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday
}

enum Mode { Ring, Vibrate, Silent }
