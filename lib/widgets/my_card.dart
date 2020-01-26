import 'package:flutter/material.dart';

import '../constants.dart';

class MyCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onPress;
  final Color color;

  MyCard({this.label, this.icon, this.color, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 80.0,
            ),
            Text(label, style: kLabelStyle)
          ],
        ),
      ),
    );
  }
}
