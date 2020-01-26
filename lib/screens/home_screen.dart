import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mimic_bmi_calculator/constants.dart';
import 'package:mimic_bmi_calculator/models/calculator_brain.dart';
import 'package:mimic_bmi_calculator/screens/result_screen.dart';
import 'package:mimic_bmi_calculator/widgets/my_bottom_button.dart';
import 'package:mimic_bmi_calculator/widgets/my_card.dart';
import 'package:mimic_bmi_calculator/widgets/my_card_increment_decrement.dart';

enum Gender {
  male,
  female,
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender selectedGender;
  bool genderIsSelected = false;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyCard(
                    label: 'MALE',
                    icon: FontAwesomeIcons.mars,
                    color: selectedGender == Gender.male
                        ? kActiveColor
                        : kInactiveColor,
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                        genderIsSelected = true;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: MyCard(
                    label: 'FEMALE',
                    icon: FontAwesomeIcons.venus,
                    color: selectedGender == Gender.female
                        ? kActiveColor
                        : kInactiveColor,
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                        genderIsSelected = true;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text('cm')
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: kInactiveColor,
                        overlayColor: kOverlayThumbColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: kBottomContainerColor),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newVal) {
                        setState(() {
                          height = newVal.toInt();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
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
                  child: MyCardIncrementDecrement(
                    label: 'WEIGHT',
                    number: weight,
                    onIncrement: () {
                      setState(() {
                        ++weight;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        --weight;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: MyCardIncrementDecrement(
                    label: 'AGE',
                    number: age,
                    onIncrement: () {
                      print('wtf');
                      setState(() {
                        ++age;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        --age;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          MyBottomButton(
            isAppUsed: genderIsSelected,
            label: 'CALCULATE',
            onPressed: () {
              if (genderIsSelected) {
                CalculatorBrain calc =
                    CalculatorBrain(weight: weight, height: height);
                Navigator.pushNamed(
                  context,
                  ResultScreen.routename,
                  arguments: ResultArguments(
                    bmi: calc.calculateBMI(),
                    status: calc.displayStatus(),
                    advice: calc.displayAdvice(),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
