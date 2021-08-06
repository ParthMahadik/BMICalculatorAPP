import 'package:bmi_calculator/Components/bottom_button.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmi,
      @required this.bmiComment,
      @required this.bmiResult});
  final String bmi;
  final String bmiResult;
  final String bmiComment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text("Your Result", style: kTitleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kactivecardColor,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmiResult.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(bmi, style: kResultNumberTextStyle),
                  Text(bmiComment,
                      style: kResultAnsTextStyle, textAlign: TextAlign.center)
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              textAtBottom: "RE-CALCULATE")
        ],
      ),
    );
  }
}
