import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:muter/models/day.dart';

class DaysInteractor with ChangeNotifier {
  List<Day> _days = [];

  DaysInteractor() {
    _getDays();
  }

  Future<List<Day>> _getDays() async {
    var initialJson = await rootBundle.loadString("assets/initial_data.json");
    Iterable jsonMap = jsonDecode(initialJson);
    _days = jsonMap.map((entry) => Day.fromJson(entry)).toList();
    notifyListeners();
    return _days;
  }

  List<Day> get days => _days;
//  Stream<List<Day>> get days {
//    _getDays().then((List<Day> days) {
//      return days;
//    }, onError: (e) {
//      return [];
//    });
//
//    return null;
//  }
//}

}
