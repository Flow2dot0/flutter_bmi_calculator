import 'package:flutter/material.dart';
import 'package:mimic_bmi_calculator/constants.dart';

class MyIconButton extends StatelessWidget {
  MyIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      fillColor: kBottomContainerColor,
      splashColor: Colors.purpleAccent,
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Icon(icon),
    );
    ;
  }
}
