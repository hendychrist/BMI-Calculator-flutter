//  calculator_brain.dart
//  BMI-Calculator

//  Created by Hendy Christian on 26/01/2021.
//  Copyright © 2020 Indonesia hendyproject. All rights reserved.

import 'dart:math';

class CalculatorBrain {

  // Constructor
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  // A Function for Return BMI as a string|| Calculate
  String calculateBMI(){
    _bmi =  weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  // Function Return Result
  String getResult(){
    if( _bmi >= 25 ){
      return 'OverWeight';
    }else if( _bmi > 18.5 ){
      return 'Normal' ;
    }else{
      return 'Underweight';
    }
  }

  // Function Return Interpretation = penafsiran / Kesimpulan.
  String getInterpretation(){
    if( _bmi >= 25 ){
      return 'You have a higher than normal body weight. Try to exercise more.';
    }else if( _bmi > 18.5 ){
      return 'You have a normal body weigtt. Good Job!' ;
    }else{
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

}