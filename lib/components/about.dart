import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:protfolio/utilis/animatedContent.dart';
import 'package:protfolio/utilis/social.dart';
import 'package:velocity_x/velocity_x.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenWidth < 900
          ? 650
          : context.screenWidth > 1200
              ? 600
              : 700,
      margin: const EdgeInsets.only(top: 20),
      width: context.screenWidth < 900
          ? context.screenWidth * 0.9
          : context.screenWidth * 0.4,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [
          Image.asset(
            "assets/user.png",
            height: 156,
          ),
          const Text("Shivani Bind",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600)),
          const Text(
            "I am a Flutter Developer and I am looking for dev roles india or usa",
            textAlign: TextAlign.center,
          ),
          Wrap(
            spacing: 10.0,
            runSpacing: 6.0,
            alignment: WrapAlignment.center,
            children: [
              Chip(
                label: const Text("Full Stack Developer"),
                backgroundColor: Vx.purple400,
                padding: const EdgeInsets.all(8.0),
                labelStyle:
                    const TextStyle(color: Colors.white, fontSize: 14.0),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Vx.purple400),
                    borderRadius: BorderRadius.circular(20)),
              ),
              Chip(
                label: const Text("Flutter Developer"),
                backgroundColor: Vx.purple400,
                padding: const EdgeInsets.all(8.0),
                labelStyle:
                    const TextStyle(color: Colors.white, fontSize: 14.0),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Vx.purple400),
                    borderRadius: BorderRadius.circular(20)),
              )
            ],
          ),
          const Divider(),
          AnimatedContent(
            iconData: FontAwesomeIcons.linkedin,
            title: "LinkedIn",
            subTitle: "shivani bind",
            onTap: () {},
          ),
          AnimatedContent(
            iconData: FontAwesomeIcons.github,
            title: "Githup",
            subTitle: "ShivuCodder",
            onTap: () {},
          ),
          const Spacer(),
          const SocialRow()
        ]),
      ),
    );
  }
}
