import 'package:bmi_calculator/Components/content.dart';
import 'package:bmi_calculator/Screens/results_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Components/bottom_button.dart';
import '../Components/reusable_card.dart';
import '../Components/roundicon_button.dart';
import '../constants.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                    gesture: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    colour: selectedGender == Gender.Male
                        ? kactivecardColor
                        : kinactivecardColor,
                    content: Content(
                      text: "MALE",
                      ic: FontAwesomeIcons.mars,
                    )),
              ),
              Expanded(
                child: ReusableCard(
                  gesture: () {
                    setState(() {
                      selectedGender = Gender.Female;
                    });
                  },
                  colour: selectedGender == Gender.Female
                      ? kactivecardColor
                      : kinactivecardColor,
                  content: Content(
                    text: "FEMALE",
                    ic: FontAwesomeIcons.venus,
                  ),
                ),
              )
            ],
          )),
          Expanded(
            child: ReusableCard(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: knumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kstyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayColor: Color(0x29EB1555),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double val) {
                          setState(
                            () {
                              height = val.toInt();
                            },
                          );
                        }),
                  )
                ],
              ),
              colour: kactivecardColor,
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kactivecardColor,
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT", style: kstyle),
                      Text(
                        weight.toString(),
                        style: knumberTextStyle,
                      ),
                      Row(children: [
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight = weight - 1;
                              });
                            }),
                        SizedBox(width: 10.0),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            })
                      ], mainAxisAlignment: MainAxisAlignment.center)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kactivecardColor,
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AGE", style: kstyle),
                      Text(
                        age.toString(),
                        style: knumberTextStyle,
                      ),
                      Row(children: [
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            }),
                        SizedBox(width: 10.0),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            })
                      ], mainAxisAlignment: MainAxisAlignment.center)
                    ],
                  ),
                ),
              )
            ],
          )),
          BottomButton(
            textAtBottom: "CALCULATE",
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight: weight, height: height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                      bmi: calc.calculateBMI(),
                      bmiComment: calc.getInterpretation(),
                      bmiResult: calc.getResult()),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
