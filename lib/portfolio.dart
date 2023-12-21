import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:protfolio/components/about.dart';
import 'package:protfolio/components/education.dart';
import 'package:protfolio/components/footer.dart';
import 'package:protfolio/components/projects.dart';
import 'package:protfolio/components/skills.dart';
import 'package:velocity_x/velocity_x.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  final skillsKey = GlobalKey();
  final educationKey = GlobalKey();
  List<Widget> items = [];
  bool isMobile = false;
  double value = 0;
  @override
  void initState() {
    items = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size(150, 45)),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const Portfolio()));
            },
            child: const Text("Home")),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size(150, 45)),
            onPressed: () {
              Scrollable.ensureVisible(educationKey.currentContext!);
            },
            child: const Text("Education")),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size(150, 45)),
            onPressed: () {
              Scrollable.ensureVisible(skillsKey.currentContext!);
            },
            child: const Text("Skills")),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isMobile = MediaQuery.of(context).size.width > 700 ? false : true;
    return Scaffold(
        backgroundColor: Vx.purple300,
        body: Stack(children: [
          //drawer
          SafeArea(
              child: Container(
            color: Vx.purple300,
            width: 200,
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Image.asset(
                        "assets/user.png",
                      ),
                    ),
                    const Text(
                      "Shivani bind",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => items[index],
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 5),
                      itemCount: items.length))
            ]),
          )),

          //main body
          TweenAnimationBuilder(
            curve: Curves.easeInExpo,
            tween: Tween<double>(begin: 0, end: value),
            duration: const Duration(milliseconds: 500),
            builder: (context, value, child) => Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..setEntry(0, 3, 200 * value)
                ..rotateY((pi / 6) * value),
              child: Scaffold(
                appBar: AppBar(
                    // leading: IconButton(
                    //   icon: const Icon(FontAwesomeIcons.barsStaggered),
                    //   onPressed: () => setState(() {
                    //     value > 0 ? value = 1 : value = 0;
                    //     print(value);
                    //   }),
                    // ),
                    title: const Text("Flutter Developer",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w400)),
                    actions: !isMobile ? items : null),
                body: SingleChildScrollView(
                  child: Container(
                    color: Vx.white,
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            alignment: WrapAlignment.center,
                            children: [
                              const About(),
                              Education(key: educationKey)
                            ],
                          ),
                          const Projects(),
                          Skill(key: skillsKey),
                          const Footer()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              setState(() {
                e.delta.dx > 0 ? value = 1 : value = 0;
              });
            },
          )
        ]));
  }
}
