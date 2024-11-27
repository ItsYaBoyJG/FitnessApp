import 'package:fitness_app/backend/local/local_storage.dart';
import 'package:flutter/material.dart';
/*
class WelcomeDisplay extends StatefulWidget {
  const WelcomeDisplay({super.key});

  @override
  State<WelcomeDisplay> createState() => _WelcomeDisplayState();
}

class _WelcomeDisplayState extends State<WelcomeDisplay> {
  final LocalStorage _localStorage = LocalStorage();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _localStorage.isFirstTime(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false || snapshot.data == null) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 5.0),
              child: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width - 5,
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width - 25,
                      child: const Text(
                        'Welcome to Fitness App. This appears to be your first time. '
                        'Before we will continue, we will ask you various information to help get you '
                        'started on your fitness journey. Press the button below to begin.',
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(
                  top: 0.5, left: 1.0, right: 1.0, bottom: 25.0),
              child: Container(
                height: 140,
                width: MediaQuery.of(context).size.width - 1,
                constraints: BoxConstraints.tight(
                    Size(MediaQuery.of(context).size.width - 1, 110)),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.75,
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'assets/images/woman_mid_stride_running.jpg'),
                  ),
                ),
              ),
            );
          }
        });
  }
}
*/