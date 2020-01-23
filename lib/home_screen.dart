// 1847#@k%
import 'package:flutter/material.dart';
import 'package:muter/days_interactor.dart';
import 'package:muter/models/day.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider(
        create: (_) => DaysInteractor(),
        child: DaysList(),
      ),
    );
  }
}

class DaysList extends StatelessWidget {
  const DaysList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DaysInteractor>(
      builder: (context, daysInteractor, _) => ListView.builder(
        padding: EdgeInsets.only(bottom: 20.0),
        itemCount: daysInteractor.days.length,
        itemBuilder: (context, index) {
          Day day = daysInteractor.days[index];
          return ChangeNotifierProvider<Day>.value(
            value: day,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          day.day,
                          style: TextStyle(
                            fontSize: 28.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Text("${day.startTime.format(context)} - ${day.endTime.format(context)}"),
                        ),
                        Text(
                          day.mode,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 8.0,
                    right: 8.0,
                    child: Switch(
                      value: day.isActive,
                      onChanged: (value) => day.isActive = value,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
