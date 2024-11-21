import 'package:fitness_app/models/widgets/header.dart';
import 'package:fitness_app/models/widgets/circle_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Header(
                title: 'Results',
                rightSide: Container(),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 35.0),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(241, 227, 255, 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Body Progress',
                        style: TextStyle(
                          color: Color.fromRGBO(190, 130, 255, 1.0),
                          fontSize: 18.0,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            print('camera pressed');
                          },
                          icon: const Icon(Icons.camera_alt))
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 25.0,
                  horizontal: 20.0,
                ),
                width: width,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(231, 241, 248, 1.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Achievements',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 40.0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleBadge(
                            color: Color.fromRGBO(190, 130, 255, 1.0),
                            title: '1st',
                            subtitle: 'Workout',
                          ),
                          CircleBadge(
                            color: Color.fromRGBO(75, 142, 255, 1.0),
                            title: '1000',
                            subtitle: 'kCal',
                          ),
                          CircleBadge(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            title: '6000',
                            subtitle: 'kCal',
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'You\'ve burned',
                      style: TextStyle(
                        color: Color.fromARGB(255, 114, 114, 114),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '480 kCal',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey[500],
                            ),
                          ),
                          Text(
                            '6000 kCal',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        child: FAProgressBar(
                      currentValue: 1500,
                      maxValue: 6000,
                    )),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 55.0,
                  left: 20.0,
                  right: 20.0,
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Weight Progress',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                        height: 250.0,
                        width: width - 40.0,
                        margin: const EdgeInsets.only(bottom: 10.0),
                        //TODO: replace this with a custom chart or from diff lib
                        child: Container()

                        /* BezierChart(
                        fromDate: DateTime.now().subtract(Duration(days: 7)),
                        toDate: DateTime.now(),
                        bezierChartScale: BezierChartScale.weekly,
                        series: [
                          BezierLine(
                            lineColor: Color.fromRGBO(241, 227, 255, 1.0),
                            lineStrokeWidth: 8.0,
                            data: [
                              DataPoint(
                                  value: 45,
                                  xAxis: DateTime.now()
                                      .subtract(Duration(days: 7))),
                              DataPoint(
                                  value: 80,
                                  xAxis: DateTime.now()
                                      .subtract(Duration(days: 5))),
                              DataPoint(
                                  value: 55,
                                  xAxis: DateTime.now()
                                      .subtract(Duration(days: 3))),
                              DataPoint(value: 100, xAxis: DateTime.now())
                            ],
                          ),
                        ],
                        config: BezierChartConfig(
                            displayDataPointWhenNoValue: false,
                            verticalIndicatorFixedPosition: false,
                            showVerticalIndicator: true,
                            showDataPoints: true,
                            footerHeight: 45.0,
                            xAxisTextStyle: TextStyle(color: Colors.blueGrey),
                            startYAxisFromNonZeroValue: true,
                            backgroundColor: Colors.white,
                            displayYAxis: true),
                      ), */
                        ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.55,
                          height: MediaQuery.of(context).size.height * 0.15,
                          margin: const EdgeInsets.only(right: 10.0),
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(231, 241, 255, 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 35.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Starting Weight',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.blueGrey[200],
                                      ),
                                    ),
                                    Text(
                                      '56 Kg',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Current',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.blueGrey[200],
                                      ),
                                    ),
                                    Text(
                                      '13 Kg',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.33,
                          padding: const EdgeInsets.all(25.0),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(241, 227, 255, 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Goal',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.blueGrey[200],
                                ),
                              ),
                              const Text(
                                'Add +',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color.fromRGBO(190, 129, 255, 1.0),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    /*   Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 45.0,
                        horizontal: 30.0,
                      ),
                      child: const Text(
                        'Track your weight every morning before your breakfast',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),*/
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.all(25.0),
                      width: width - 40.0,
                      margin: const EdgeInsets.only(bottom: 30.0),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(241, 227, 255, 1.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Text(
                        'Enter today\'s weight',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(190, 130, 255, 1.0),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
