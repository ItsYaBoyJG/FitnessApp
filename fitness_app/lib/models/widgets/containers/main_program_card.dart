import 'package:flutter/material.dart';

class MainProgramCard extends StatelessWidget {
  const MainProgramCard(
      {super.key,
      required this.image,
      required this.cardTitle,
      required this.postTime,
      required this.onTap});

  final String image;
  final String cardTitle;
  final String postTime;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: (MediaQuery.of(context).size.width - 40) / 2,
      margin: const EdgeInsets.only(
        top: 40.0,
        left: 20.0,
        right: 20.0,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
        color: Colors.white70,
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 25.0,
            offset: Offset(8.0, 8.0),
          ),
        ],
      ),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 60.0,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cardTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  /*  Text(
                postTime,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ) */
                ],
              ),
            ),
          )),
    );
  }
}
