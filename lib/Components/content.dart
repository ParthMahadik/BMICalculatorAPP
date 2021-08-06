import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  Content({@required this.text, @required this.ic});
  final String text;
  final IconData ic;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          ic,
          size: 80.0,
        ),
        SizedBox(height: 18),
        Text(
          text,
          style: kstyle,
        )
      ],
    );
  }
}
