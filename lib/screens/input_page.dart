import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../components/bottom_button.dart';
import '../components/round_button.dart';
import '../constant.dart';
import '../calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  // void updateColor(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = widgetColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }
  //   if (gender == Gender.female) {
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = widgetColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }

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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                        colour: selectedGender == Gender.male
                            ? kactiveColor
                            : kinactiveCardColor,
                        cardChild: GenderCard(
                            icon: FontAwesomeIcons.mars, label: 'MALE')),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? kactiveColor
                        : kinactiveCardColor,
                    cardChild: GenderCard(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ))
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            colour: kactiveColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT', style: klabelTextSyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: knumberStyle,
                    ),
                    Text(
                      'cm',
                      style: klabelTextSyle,
                    ),
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 120,
                  max: 200,
                  activeColor: Color(0xFFEB1555),
                  inactiveColor: Color(0xFF8D8E98),
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: kactiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: klabelTextSyle,
                      ),
                      Text(
                        weight.toString(),
                        style: knumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight = weight + 1;
                              });
                            },
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          RoundButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight = weight - 1;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: kactiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: klabelTextSyle,
                      ),
                      Text(
                        age.toString(),
                        style: knumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age = age + 1;
                              });
                            },
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          RoundButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age = age - 1;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          BottomButton(
              buttontitle: 'CALCULATE',
              ontap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                          bmiResult: calc.calculateBMI(),
                          intrepretation: calc.getInterpretation(),
                          resultText: calc.getResult())),
                );
              }),
        ],
      ),
    );
  }
}
