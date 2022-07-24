import 'package:bmi_calculator/Input_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/reusable_card.dart';
import "main.dart";

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

class Results extends StatelessWidget {
  final String bmiresult;
  final String resulttext;
  final String interpretation;

  Results(
      {required this.bmiresult,
      required this.resulttext,
      required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusable_card(
              color: activecardcolor,
              Cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resulttext.toUpperCase(),
                    style: TextStyle(
                      color: Color(0XFF24d876),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiresult,
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottombutton(
              onTap: () {
                Navigator.pop(context);
              },
              buttontitle: "RE-CALCULATE"),
        ],
      ),
    );
  }
}
