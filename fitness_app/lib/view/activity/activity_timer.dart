/*
import 'package:fitness_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ActivityTimer extends StatelessWidget {
  const ActivityTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: OrientationBuilder(builder: (context, orientation) {
          return Portrait(image: image, tag: tag);
        }),
      ),
    );
  }
}

class Portrait extends StatelessWidget {
  const Portrait({super.key, required this.image, required this.tag});

  final String image, tag;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            Hero(
              tag: tag,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 270,
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                onTap: () {
                  context.pop();
                },
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
          height: size.height - 270.0,
          width: size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      'Plank',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Next: Push-ups',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: CircularPercentIndicator(
                      radius: size.width * 0.60,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 16.0,
                      percent: 0.86,
                      center: Text(
                        '43',
                        style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[400],
                        ),
                      ),
                      backgroundColor: Colors.grey[300]!,
                      circularStrokeCap: CircularStrokeCap.round,
                      linearGradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(190, 130, 255, 1.0),
                          Color.fromRGBO(105, 139, 255, 1.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 55.0,
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(232, 242, 248, 1.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Icon(
                      Icons.pause,
                      color: Color.fromRGBO(82, 126, 255, 1.0),
                      size: 35.0,
                    ),
                  ),
                  Container(
                    width: size.width - 130.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(232, 242, 248, 1.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Color.fromRGBO(82, 126, 255, 1.0),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Landscape extends StatelessWidget {
  final String image, tag;

  const Landscape({super.key, required this.image, required this.tag});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.network(
          image,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 40.0,
          left: 40.0,
          child: Text(
            'Plank',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w900,
              color: Colors.grey[500],
            ),
          ),
        ),
        Positioned(
          top: 80.0,
          left: 40.0,
          child: Text(
            'Next: Push-ups',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              color: Colors.grey[800],
            ),
          ),
        ),
        Positioned(
            top: 30.0,
            left: size.width - 60.0,
            child: GestureDetector(
                child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      size: 29.0,
                      color: Colors.grey[600],
                    )),
                onTap: () {
                  Navigator.pop(context);
                })),
        Positioned(
            left: 40.0,
            top: size.height - 60.0,
            child: Text(
              '43',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w900,
                color: Colors.grey[500],
              ),
            )),
        Positioned(
            top: size.height - 80.0,
            left: size.width / 2 - 30.0,
            child: Container(
                width: 60.0,
                height: 60.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.pause,
                  size: 38.0,
                ))),
        Positioned(
          top: size.height - 80.0,
          left: size.width - 170.0,
          child: Container(
            height: 60.0,
            width: 145.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(360.0),
            ),
            child: const Center(
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
*/