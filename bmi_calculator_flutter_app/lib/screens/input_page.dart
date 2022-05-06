import 'package:bmi_calculator_flutter_app/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_buttton.dart';
import 'package:bmi_calculator_flutter_app/calculator_brain.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age=19;






  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                    colour: (selectedGender == Gender.male) ? kActiveCardColour : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    colour: (selectedGender == Gender.female) ? kActiveCardColour : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ),
            ],
          )),

          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text('HEIGHT',style: kLabelTextStyle,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children:<Widget>[
                      Text(height.toString(), style: kNumberTextStyle,),
                      Text('cm', style: kLabelTextStyle,),
                    ],
                  ),

                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 240.0,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),

          Expanded(
              child: Row(

            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Weight',style: kLabelTextStyle,),

                      Text(weight.toString(),style: kNumberTextStyle,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          RoundIconButton(
                              icon:FontAwesomeIcons.minus,
                              onPressed:(){
                                setState(() {
                                  if(weight>1)
                                    {
                                      weight--;
                                    }
                                });
                              }
                          ),

                          SizedBox(
                            width: 10.0,
                          ),

                          RoundIconButton(
                              icon:FontAwesomeIcons.plus,
                              onPressed:(){
                                setState(() {
                                  if(weight<250)
                                  {
                                    weight++;
                                  }
                                });
                              }
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ),

              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Age',style: kLabelTextStyle,),

                      Text(age.toString(),style: kNumberTextStyle,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          RoundIconButton(
                              icon:FontAwesomeIcons.minus,
                              onPressed:(){
                                setState(() {
                                  if(age>1)
                                  {
                                    age--;
                                  }
                                });
                              }
                          ),

                          SizedBox(
                            width: 10.0,
                          ),

                          RoundIconButton(
                              icon:FontAwesomeIcons.plus,
                              onPressed:(){
                                setState(() {
                                  if(age<250)
                                  {
                                    age++;
                                  }
                                });
                              }
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ],
          )),

          BottomButton(
              onTap:(){
                CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultPage(resultText: calc.calculateBMI(),bmiResult: calc.getResult(),interpretation: calc.getInterpretation(),)));
                },
                buttonTitle:'Calculate',
          ),
        ],
      ),
    );
  }
}






