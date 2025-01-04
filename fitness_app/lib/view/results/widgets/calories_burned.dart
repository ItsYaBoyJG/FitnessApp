import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/data/auth/user_auth.dart';
import 'package:fitness_app/providers/future_providers.dart';
import 'package:fitness_app/models/data/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class CaloriesBurned extends ConsumerStatefulWidget {
  const CaloriesBurned({super.key, required this.caloriesGoal});

  final double caloriesGoal;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CaloriesBurnedState();
  }
}

class _CaloriesBurnedState extends ConsumerState<CaloriesBurned> {
  final UserAuth _userAuth = UserAuth();

  double _maxValue = 0.0;
  double _currentValue = 0.0;

  List<ChartData> chartData = [];

  void currentCalorieGoal(
      Map<int, QueryDocumentSnapshot<Map<String, dynamic>>> data) {
    List vals = [];
    num v = 0;
    for (final element in data.entries) {
      if (element.value.data()['caloriesBurned'] != null) {
        vals.add(element.value.data()['caloriesBurned']);
      } else {
        return;
      }
    }
    for (var i = 0; i < vals.length; i++) {
      v += vals[i];
    }
    setState(() {
      _currentValue = double.parse(v.toString());
    });
  }

  void maxValue(double maxValue) {
    setState(() {
      _maxValue = maxValue;
    });
  }

  void getChartData(QuerySnapshot<Map<String, dynamic>> data) {
    for (final element in data.docs) {
      chartData.add(ChartData(element.id, element.data()['currentWeight']));
    }
  }

  @override
  void initState() {
    maxValue(widget.caloriesGoal);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final exerciseData =
        ref.watch(userExerciseDataProvider(_userAuth.getUserId()));
    return exerciseData.when(data: (data) {
      if (data.docs.isNotEmpty) {
        final eData = data.docs.asMap();
        currentCalorieGoal(eData);
        getChartData(data);
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.58,
          width: MediaQuery.of(context).size.width - 5,
          child: Column(
            children: [
              const Text(
                'You burned',
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
                      '$_currentValue Cal',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey[500],
                      ),
                    ),
                    Text(
                      'of',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey[500],
                      ),
                    ),
                    Text(
                      '${widget.caloriesGoal} Cal',
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
                height: 60,
                width: MediaQuery.of(context).size.width - 20,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
                child: FAProgressBar(
                  currentValue: _currentValue,
                  maxValue: _maxValue,
                  progressColor: Colors.purpleAccent,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: data.docs.map((element) {
                    /// should create another doc in firebase for total calories burned to reference
                    /// should also add some sort of chart for weight changes
                    return Container(
                      color: Colors.white24,
                      height: 80,
                      width: MediaQuery.of(context).size.width - 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Date: ${element.id}'),
                          Text('Weight: ${element['currentWeight']}'),
                          Text('Calories Burned: ${element['caloriesBurned']}'),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 250,
                width: 250,
                child: SfSparkLineChart.custom(
                  trackball: const SparkChartTrackball(
                      activationMode: SparkChartActivationMode.tap),
                  marker: const SparkChartMarker(
                      displayMode: SparkChartMarkerDisplayMode.all),
                  labelDisplayMode: SparkChartLabelDisplayMode.all,
                  xValueMapper: (index) => chartData[index].dateTime,
                  yValueMapper: (index) => chartData[index].weight,
                  dataCount: data.docs.length,
                ),
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
    }, error: (error, stackTrace) {
      return const Text('error');
    }, loading: () {
      return const CircularProgressIndicator.adaptive();
    });
  }
}
