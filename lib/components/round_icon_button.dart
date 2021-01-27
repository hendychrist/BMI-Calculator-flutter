//  round_icon_button.dart
//  BMI-Calculator

//  Created by Hendy Christian on 26/01/2021.
//  Copyright © 2020 Indonesia hendyproject. All rights reserved.

import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(

      child: Icon(icon),
      onPressed: onPressed,
      elevation: 100.0,

      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),

      shape: CircleBorder(),
      fillColor:Color(0xFF4C4F5E),
    );
  }
}