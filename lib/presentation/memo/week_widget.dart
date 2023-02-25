import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/src/theme/theme_color.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeekWidget extends StatefulWidget {
  const WeekWidget({Key? key}) : super(key: key);

  @override
  _WeekWidgetState createState() => _WeekWidgetState();
}

class _WeekWidgetState extends State<WeekWidget> {
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true, header: ' ', canShowMarker: false);
    super.initState();
  }
  String value = "";
  bool disableDropdown = true;
  List<DropdownMenuItem<String>> menuItems = [];

  // final jan = {
  //   "1" : "Week 1",
  //   "2" : "Week 2",
  //   "3" : "Week 3",
  //   "4" : "Week 4"
  // };
  //
  // final feb = {
  //   "1" : "Week 1",
  //   "2" : "Week 2",
  //   "3" : "Week 3",
  //   "4" : "Week 4"
  // };
  //
  // final mar = {
  //   "1" : "Week 1",
  //   "2" : "Week 2",
  //   "3" : "Week 3",
  //   "4" : "Week 4"
  // };
  //
  // final apr = {
  //   "1" : "Week 1",
  //   "2" : "Week 2",
  //   "3" : "Week 3",
  //   "4" : "Week 4"
  // };
  //
  // final may = {
  //   "1" : "Week 1",
  //   "2" : "Week 2",
  //   "3" : "Week 3",
  //   "4" : "Week 4"
  // };
  //
  // final jun = {
  //   "1" : "Week 1",
  //   "2" : "Week 2",
  //   "3" : "Week 3",
  //   "4" : "Week 4"
  // };
  //
  // final jul = {
  //   "1" : "Week 1",
  //   "2" : "Week 2",
  //   "3" : "Week 3",
  //   "4" : "Week 4"
  // };
  //
  // final aug = {
  //   "1" : "Week 1",
  //   "2" : "Week 2",
  //   "3" : "Week 3",
  //   "4" : "Week 4"
  // };
  //
  // final sep = {
  //   "1" : "Week 1",
  //   "2" : "Week 2",
  //   "3" : "Week 3",
  //   "4" : "Week 4"
  // };
  //
  // final oct = {
  //   "1" : "Week 1",
  //   "2" : "Week 2",
  //   "3" : "Week 3",
  //   "4" : "Week 4"
  // };
  //
  // final nov = {
  //   "1" : "Week 1",
  //   "2" : "Week 2",
  //   "3" : "Week 3",
  //   "4" : "Week 4"
  // };
  //
  // final dec = {
  //   "1" : "Week 1",
  //   "2" : "Week 2",
  //   "3" : "Week 3",
  //   "4" : "Week 4"
  // };

  // void populateMonth() {
  //   for(String key in jan.keys) {
  //     menuItems.add(DropdownMenuItem<String>(
  //       value: jan[key],
  //       child: Center(child: Text(jan[key]!)),
  //       ));
  //   }
  // }

  // void valueChanged(_value) {
  //   if(_value == "jan") {
  //     populateMonth();
  //   }else if(_value == "feb") {
  //     populateMonth();
  //   }else if(_value == "mar") {
  //     populateMonth();
  //   }else if(_value == "apr") {
  //     populateMonth();
  //   }else if(_value == "may") {
  //     populateMonth();
  //   }else if(_value == "jun") {
  //     populateMonth();
  //   }else if(_value == "jul") {
  //     populateMonth();
  //   }else if(_value == "aug") {
  //     populateMonth();
  //   }else if(_value == "sep") {
  //     populateMonth();
  //   }else if(_value == "oct") {
  //     populateMonth();
  //   }else if(_value == "nov") {
  //     populateMonth();
  //   }else if(_value == "dec") {
  //     populateMonth();
  //   }
  //   setState(() {
  //     value = _value;
  //     disableDropdown = false;
  //   });
  // }

  // void secondvalueChanged(_value) {
  //   setState(() {
  //     value = _value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 310,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ThemeColor.greenBackground
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildChart(),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "สรุปรวมรายสัปดาห์",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 440,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ThemeColor.greenBackground
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 150,
                        child: _dropOne()
                      ),
                      SizedBox(
                          width: 150,
                          child: _dropTwo()
                      )
                    ],
                  ),
                  //อาทิตย์
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("วันอาทิตย์"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("190 กรัม"),
                      Text("350 กิโลแคลอรี"),
                    ],
                  ),
                  //จันทร์
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("วันอาทิตย์"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("190 กรัม"),
                      Text("350 กิโลแคลอรี"),
                    ],
                  ),
                  //อังค่ร
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("วันอาทิตย์"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("190 กรัม"),
                      Text("350 กิโลแคลอรี"),
                    ],
                  ),
                  //ำุธ
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("วันอาทิตย์"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("190 กรัม"),
                      Text("350 กิโลแคลอรี"),
                    ],
                  ),
                  //พฤหัส
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("วันอาทิตย์"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("190 กรัม"),
                      Text("350 กิโลแคลอรี"),
                    ],
                  ),
                  //ศุกร์
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("วันอาทิตย์"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("190 กรัม"),
                      Text("350 กิโลแคลอรี"),
                    ],
                  ),
                  //เสาร์
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("วันอาทิตย์"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("190 กรัม"),
                      Text("350 กิโลแคลอรี"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _dropOne() {
    return DropdownButtonFormField(
      items: const [
        DropdownMenuItem(
            value: "1",
            child: Center(child: Text("January"))
        ),
        DropdownMenuItem(
            value: "2",
            child: Center(child: Text("February"))
        ),
        DropdownMenuItem(
            value: "3",
            child: Center(child: Text("March"))
        ),
        DropdownMenuItem(
            value: "4",
            child: Center(child: Text("April"))
        ),
        DropdownMenuItem(
            value: "5",
            child: Center(child: Text("May"))
        ),
        DropdownMenuItem(
            value: "6",
            child: Center(child: Text("June"))
        ),
        DropdownMenuItem(
            value: "7",
            child: Center(child: Text("July"))
        ),
        DropdownMenuItem(
            value: "8",
            child: Center(child: Text("August"))
        ),
        DropdownMenuItem(
            value: "9",
            child: Center(child: Text("September"))
        ),
        DropdownMenuItem(
            value: "10",
            child: Center(child: Text("October"))
        ),
        DropdownMenuItem(
            value: "11",
            child: Center(child: Text("November"))
        ),
        DropdownMenuItem(
            value: "12",
            child: Center(child: Text("December"))
        ),
      ],
      onChanged: (_value) {
        print(_value);
        //valueChanged(_value);
      },
      hint: Text("Select month"),
    );
  }

  Widget _dropTwo() {
    return DropdownButtonFormField(
      items: const [
        DropdownMenuItem(
            value: "1",
            child: Center(child: Text("Week 1"))
        ),
        DropdownMenuItem(
            value: "2",
            child: Center(child: Text("Week 2"))
        ),
        DropdownMenuItem(
            value: "3",
            child: Center(child: Text("Week 3"))
        ),
        DropdownMenuItem(
            value: "4",
            child: Center(child: Text("Week 4"))
        ),
      ],
      onChanged: (_value) {
        print(_value);
        //valueChanged(_value);
      },
      //disableDropdown ? null : (value) {secondvalueChanged(value);},
      hint: Text("Select Week"),
    );
  }

  SfCartesianChart _buildChart() {
    return SfCartesianChart(
      palette: const <Color>[
        Color.fromRGBO(246, 114, 128, 1),
      ],
      plotAreaBorderWidth: 0,
      backgroundColor: Colors.transparent,
      primaryXAxis: CategoryAxis(
        //rangePadding: ChartRangePadding.additional,
        majorGridLines: const MajorGridLines(width: 0)
      ),
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: 400,
        axisLine: const AxisLine(width: 0),
        labelFormat: '{value} g',
        majorTickLines: const MajorTickLines(size: 0)
      ),
      tooltipBehavior: _tooltipBehavior!,
      series: _getDefaultColumnSeries(),
    );
  }

  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries() {
    return <ColumnSeries<ChartSampleData, String>> [
      ColumnSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData('Sun', 100),
          ChartSampleData('Mon', 250),
          ChartSampleData('Tue', 390),
          ChartSampleData('Wed', 100),
          ChartSampleData('Thu', 80),
          ChartSampleData('Fri', 120),
          ChartSampleData('Sat', 260)
        ],
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        // dataLabelSettings: const DataLabelSettings(
        //   isVisible: true, textStyle: TextStyle(fontSize: 12)
        // )
      )
    ];
  }
}

class ChartSampleData {
  ChartSampleData(this.x, this.y);
  final String x;
  final double y;
}
