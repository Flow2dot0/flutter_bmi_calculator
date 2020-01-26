import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mimic_bmi_calculator/widgets/my_icon_button.dart';

import '../constants.dart';

class MyCardIncrementDecrement extends StatelessWidget {
  final String label;
  final int number;
  final Function onIncrement;
  final Function onDecrement;

  MyCardIncrementDecrement(
      {this.label, this.number, this.onIncrement, this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            label,
            style: kLabelStyle,
          ),
          Text(
            number.toString(),
            style: kNumberStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MyIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: onDecrement,
              ),
              MyIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: onIncrement,
              ),
            ],
          )
        ],
      ),
    );
  }
}
