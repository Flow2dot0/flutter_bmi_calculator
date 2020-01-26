import 'package:flutter/material.dart';
import 'package:mimic_bmi_calculator/constants.dart';
import 'package:mimic_bmi_calculator/widgets/my_bottom_button.dart';

class ResultScreen extends StatelessWidget {
  static const routename = '/results';

  @override
  Widget build(BuildContext context) {
    final ResultArguments args = ModalRoute.of(context).settings.arguments;
    print(args.bmi);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        'Your Result!',
                        style: kResultLabelStyle,
                      ),
                    ),
                  ),
                  Divider(
                    height: 2,
                    color: Colors.white,
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        args.status.toUpperCase(),
                        style: kStatusStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        args.bmi,
                        style: kBMIStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Center(
                        child: Text(
                          args.advice,
                          textAlign: TextAlign.center,
                          style: kBottomTextStyle.copyWith(
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          MyBottomButton(
            isAppUsed: true,
            label: 'RE-CALCULATE',
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}

// get the args in routing
class ResultArguments {
  ResultArguments(
      {@required this.status, @required this.bmi, @required this.advice});

  final String status, bmi, advice;
}
