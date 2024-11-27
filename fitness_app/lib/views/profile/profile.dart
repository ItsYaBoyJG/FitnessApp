import 'package:fitness_app/widgets/main_program_card.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          OutlinedButton(onPressed: () {}, child: const Text('Account'))
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width - 10,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 163, 144, 215),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'username',
                  style: TextStyle(fontSize: 14.0),
                ),
                CircleAvatar(
                  foregroundImage: AssetImage(''),
                  radius: 50,
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width - 5,
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.45,
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 148, 123, 231),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    children: [Text(' View Previous Goals')],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.45,
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 148, 123, 231),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    children: [Text('Saved Recipes')],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
                  child: const Text('Friends')),
              ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
                  child: const Text('Followers')),
            ],
          ),
          const MainProgramCard(
              image: 'assets/images/image004.jpg',
              cardTitle: 'For You',
              postTime: '8 min'),
        ],
      ),
    );
  }
}
