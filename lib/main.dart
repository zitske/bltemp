import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double temperature = 20.0;
    double maxtemp = 100;
    double tempPercent = ((100 * temperature) / maxtemp);

    final List<ChartData> chartData = [
      ChartData('value', 100 - tempPercent, Color(0xFFF9F9F9)),
      ChartData('value', tempPercent, Colors.white),
    ];

    return Scaffold(
      body: Container(
        color: Color(0xFF0C0C0C),
        child: Center(
            child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationX(math.pi),
              child: Container(
                alignment: Alignment.center,
                height: width * 0.80,
                width: width * 0.80,
                child: SfCircularChart(
                    margin: EdgeInsets.all(15),
                    palette: <Color>[
                      Color(0xFFF9F9F9),
                      Color(0xFF00FFC2),
                    ],
                    series: <CircularSeries>[
                      // Render pie chart
                      PieSeries<ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          dataLabelSettings:
                              DataLabelSettings(isVisible: false))
                    ]),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: width * 0.35,
              width: width * 0.35,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(width)),
                  boxShadow: [BoxShadow(blurRadius: 15.0)]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${temperature.toInt()}°C",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 7 * (width / 100),
                        fontWeight: FontWeight.normal)),
                Icon(Icons.thermostat, size: 6 * (width / 100))
              ],
            )
          ],
        )),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
