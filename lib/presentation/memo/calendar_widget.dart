import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/src/theme/theme_color.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            locale: "en-US",
            headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true
            ),
            calendarFormat: CalendarFormat.week,
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today,
            firstDay: DateTime.utc(2022, 01, 30),
            lastDay: DateTime.utc(2030, 01, 30),
            onDaySelected: _onDaySelected,
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle
                //borderRadius: BorderRadius.circular(10),
              ),
              selectedDecoration: BoxDecoration(
                  color: ThemeColor.greenBackground,
                  shape: BoxShape.circle
                //borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
