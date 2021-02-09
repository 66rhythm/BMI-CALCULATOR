import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.intrepretation, this.bmiResult, this.resultText});
  final String bmiResult;
  final String resultText;
  final String intrepretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Your Result',
                style: kTitleStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kactiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText, style: kResultTextStyle),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      intrepretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )),
          BottomButton(
            buttontitle: 'RECALCULATE',
            ontap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
