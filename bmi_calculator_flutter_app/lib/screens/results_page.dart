import 'package:bmi_calculator_flutter_app/components/bottom_button.dart';
import 'package:bmi_calculator_flutter_app/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import 'package:bmi_calculator_flutter_app/components/bottom_button.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiResult,required this.resultText,required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                  'Your Result',
                   style: kTitleTextStyle,
              ),
            ),
          ),

          Expanded(
              flex: 5,
              child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:<Widget>[
                      Text(
                        bmiResult,
                           style: kResultTextStyle,
                      ),

                      Text(
                        resultText,
                        style: kBMITextStyle,
                      ),

                      Text(
                        interpretation,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),

                    ],
                  ),
              ),
          ),

          BottomButton(
              buttonTitle:'RE-CALCULATE' ,
              onTap:(){
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
