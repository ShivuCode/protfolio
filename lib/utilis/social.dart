import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:protfolio/utilis/animatedIconButton.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedIconButton(
          iconData: FontAwesomeIcons.facebook,
          onTap: () {},
        ),
        AnimatedIconButton(
          iconData: FontAwesomeIcons.instagram,
          onTap: () {},
        ),
        AnimatedIconButton(
          iconData: FontAwesomeIcons.github,
          onTap: () {},
        ),
      ],
    );
  }
}
