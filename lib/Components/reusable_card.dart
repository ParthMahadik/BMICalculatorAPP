import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.content, this.gesture});
  final Color colour;
  final Widget content;
  final Function gesture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gesture,
      child: Container(
        child: content,
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
        margin: EdgeInsets.all(15),
      ),
    );
  }
}
