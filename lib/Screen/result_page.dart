//  result_page.dart
//  BMI-Calculator

//  Created by Hendy Christian on 26/01/2021.
//  Copyright © 2020 Indonesia hendyproject. All rights reserved.

import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.interpretation, @required this.bmiResult, @required this.resultText });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
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
                      style:fontStyleUntukResult,
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

                      children: <Widget>[

                            Text(
                                resultText.toUpperCase(),
                                 style: kResultTextStyle,
                            ),

                            Text(
                              bmiResult,
                              style: kBMITextStyle,
                            ),

                            Text(
                                interpretation,
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 22,
                                 ),
                            ),

                      ],
                  ),

                ),
            ),

            BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: (){
                Navigator.pop(context);
              },
            ),

        ],
      ),
    );
  }
}