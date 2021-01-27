//  input_page.dart
//  BMI-Calculator

//  Created by Hendy Christian on 26/01/2021.
//  Copyright © 2020 Indonesia hendyproject. All rights reserved.

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'result_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 170;
  int weight = 75;
  int age = 19;

  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),

      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          //Baris 1 -> 2 Column
          Expanded(
           child: Row(
            children: <Widget>[

              //Column 1.1
              Expanded( // div
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour,
                    cardChild: IconContent(icon: FontAwesomeIcons.mars, label:'MALE'),
                ),
              ),

              //Column 1.2
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE'
                    ),
                ),
              ),

            ],
          )),

          //Baris 2 -> 1 Column
          Expanded(
           child: Row(
            children: <Widget>[

              // Column 2.1
              Expanded(
                child: ReusableCard(
                  colour: kInactiveCardColour,

                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                        Text(
                            'HEIGHT',
                            style: kLabelTextStyle,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline, //Yang membuat cm turun kebawah

                            children:<Widget>[
                              Text(
                                  height.toString(),
                                  style: myFontType,
                              ),
                              Text(
                                'cm',
                                style: kLabelTextStyle,
                              ),
                            ],

                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                              thumbColor: Color(0xFFEB1555),
                              activeTrackColor: Colors.white,
                              overlayColor: Color(0x60EB1555),
                          ),
                             child: Slider(
                            value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,

                            // Ini warna slider yang tidak aktif di sebela kanan ThumbShape
                            inactiveColor: Color(0xFF8D8E98),
                                onChanged: (double newValue){
                                setState(() {
                                  height = newValue.toInt();
                                });
                                  print(newValue);
                                },
                          ),
                        ),

                      ],

                    ),
                ),
              ),

            ],
          )),

          // Baris 3 -> 2 Column
          Expanded(
              child: Row(
                children: <Widget>[

                  //Column 3.1
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,

                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                                style: kLabelTextStyle,
                            ),

                            Text(
                              weight.toString(),
                                style: myFontType,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState((){
                                        weight--;
                                      });
                                    }
                                  ),

                                  SizedBox(
                                    width: 10.0,
                                  ),

                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: (){
                                      setState(() {
                                        weight++;
                                      });
                                    }
                                  ),

                                ],
                            ),

                          ],
                      ),

                    ),
                  ),

                  //Column 3.2
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,

                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),

                          Text(
                            age.toString(),
                            style: myFontType,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState((){
                                      age--;
                                    });
                                  }
                              ),

                              SizedBox(
                                width: 10.0,
                              ),

                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                      age++;
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
              )
          ),

          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){

              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                   builder: (context) =>
                       ResultPage(
                         bmiResult: calc.calculateBMI(),
                         resultText: calc.getResult(),
                         interpretation: calc.getInterpretation(),
                       ),
                  ),
              );

            },
          ),

        ],
      )

    );
  }
}




