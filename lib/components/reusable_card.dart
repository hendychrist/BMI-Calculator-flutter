//  reusable_card.dart
//  BMI-Calculator

//  Created by Hendy Christian on 26/01/2021.
//  Copyright © 2020 Indonesia hendyproject. All rights reserved.

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({ @required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color:colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

}