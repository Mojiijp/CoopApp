import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/presentation/memo/calendar_widget.dart';
import 'package:fruits_and_veggies/presentation/memo/record_list.dart';
import 'package:fruits_and_veggies/presentation/memo/week_widget.dart';
import 'package:fruits_and_veggies/src/theme/theme_color.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoPage extends StatefulWidget {
  const MemoPage({Key? key}) : super(key: key);

  @override
  _MemoPageState createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage> {
  // List<String> items = [
  //   'Apple', 'Avocado', 'Blueberry', 'Broccoli', 'Cabbage', 'Carrot', 'Cherry',
  //   'Guava', 'Mulberry', 'Orange', 'Papaya', 'Pumpkin', 'Raspberry', 'Strawberry',
  //   'Tomato', 'Watermelon'
  // ];
  // String? selectedItems = 'Apple';

  //////////calendar1/////////////////
  DateTime today = DateTime.now();

  get buildBox => null;
  void _onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      today = day;
    });
  }
  ///////////////calendar1//////////////

  var gram;

  final gramCon = TextEditingController();

  bool isVisible = true;

  //////calendar///////////////////////////////////////////
  late Map<DateTime, List<dynamic>> _events;
  late List<dynamic> _selectedEvents;
  late TextEditingController _eventController;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    prefsData();
  }

  prefsData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }
  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }
  //////////////calendar////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        /////Tabbar Today - Week
        child: DefaultTabController(
          length: 2,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: const Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                        color: ThemeColor.green,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    //labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(text: "Today"),
                      Tab(text: "Week"),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                      children: [
                        _firstPage(),
                        const WeekWidget(),
                        //const Center(child: Text("WEEK"),)
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _firstPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _calendarWid(),
          //const CalendarWidget(),
          _circularIndicator(),
          const Padding(
            padding: EdgeInsets.only(left: 5, top: 3),
            child: Text(
              "บันทึกผัก / ผลไม้",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          RecordList(),
         ],
      ),
    );
  }

  Widget _calendarWid () {
    return   TableCalendar(
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
            color: ThemeColor.green,
            shape: BoxShape.circle
          //borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }


  Widget _circularIndicator() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Stack(
        children: [
          Container(
            width: 500,
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeColor.greenBackground
            ),
          ),
          Positioned(
            left: 15,
            top: 20,
            child: CircularPercentIndicator(
              radius: 70,
              lineWidth: 15,
              percent: 0.80,
              center: const Text('80 %'),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: ThemeColor.green,
              backgroundColor: Colors.white,
                  //backgroundColor: Color(0xffD9D9D9),
              animation: true,
              animationDuration: 4000,
            ),
          ),
          const Positioned(
            left: 170,
            top: 60,
            child: Text(
              "วันนี้คุณทานผัก / ผลไม้\nถึง 400 กรัมหรือยัง?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }


  // _showAddDialog() async {
  //   await showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         backgroundColor: Colors.white70,
  //         title: Text("Add Events"),
  //         content: TextField(
  //           controller: _eventController,
  //         ),
  //         actions: <Widget>[
  //           ElevatedButton(
  //             child: Text("Save",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
  //             onPressed: () {
  //               if (_eventController.text.isEmpty) return;
  //               setState(() {
  //                 if (_events[_controller.selectedDay] != null) {
  //                   _events[_controller.selectedDay]
  //                       ?.add(_eventController.text);
  //                 } else {
  //                   _events[_controller.selectedDay] = [
  //                     _eventController.text
  //                   ];
  //                 }
  //                 prefs.setString("events", json.encode(encodeMap(_events)));
  //                 _eventController.clear();
  //                 Navigator.pop(context);
  //               });
  //
  //             },
  //           )
  //         ],
  //       ));
  //   }
}

