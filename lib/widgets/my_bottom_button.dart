import 'package:flutter/material.dart';

import '../constants.dart';

class MyBottomButton extends StatelessWidget {
  const MyBottomButton({
    Key key,
    @required this.isAppUsed,
    this.label,
    this.onPressed,
  }) : super(key: key);

  final bool isAppUsed;
  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 40.0),
      onPressed: onPressed,
      child: Text(
        label,
        style: kBottomTextStyle,
      ),
      color: !isAppUsed ? kPrimaryColor : kBottomContainerColor,
    );
  }
}
