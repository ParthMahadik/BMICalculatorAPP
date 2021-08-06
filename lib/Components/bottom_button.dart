import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.textAtBottom});
  final Function onTap;
  final String textAtBottom;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kbarColor,
        padding: EdgeInsets.only(bottom: 20),
        child: Center(
          child: Text(textAtBottom, style: kLargeNumberTextStyle),
        ),
        width: double.infinity,
        height: khght,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
