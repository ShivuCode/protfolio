import 'package:flutter/material.dart';
import 'package:protfolio/utilis/social.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 20),
      color: Colors.white,
      child: const Column(children: [
        SocialRow(),
        Text("Flutter Developer"),
        Text(
          "Shivani bind",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
        )
      ]),
    );
  }
}
