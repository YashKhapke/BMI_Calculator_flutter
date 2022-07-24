import "package:bmi_calculator/reusable_card.dart";
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "gender_icon.dart";
import 'package:bmi_calculator/results_bmi.dart';
import "calculator_brain.dart";

const inactivecardcolor = Color(0xFF111328);
const activecardcolor = Color(0xFF1D1E33);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedgender;
  int height = 180;
  int weight = 60;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("BMI Calculator",
                style: TextStyle(
                  fontSize: 25.0,
                  letterSpacing: 1.5,
                )),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Reusable_card(
                      onpress: () {
                        setState(() {
                          selectedgender = Gender.male;
                        });
                      },
                      color: selectedgender == Gender.male
                          ? activecardcolor
                          : inactivecardcolor,
                      Cardchild: icon_gender(
                          icon: FontAwesomeIcons.mars, text: "MALE"),
                    ),
                  ),
                  Expanded(
                    child: Reusable_card(
                      onpress: () {
                        setState(() {
                          selectedgender = Gender.female;
                        });
                      },
                      color: selectedgender == Gender.female
                          ? activecardcolor
                          : inactivecardcolor,
                      Cardchild: icon_gender(
                          icon: FontAwesomeIcons.venus, text: "FEMALE"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Reusable_card(
                Cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style: TextStyle(
                        color: Color(0xFF8D8E98),
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Text(
                          "cm",
                          style: TextStyle(
                            color: Color(0xFF8D8E98),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 250,
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
                color: const Color(0xFF1D1E33),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Reusable_card(
                      color: const Color(0xFF1D1E33),
                      Cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: TextStyle(
                              color: Color(0xFF8D8E98),
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  weight.toString(),
                                  style: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              const Text(
                                "kg",
                                style: TextStyle(
                                  color: Color(0xFF8D8E98),
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                backgroundColor: const Color(0xFF4C4F5E),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: const Icon(FontAwesomeIcons.plus,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              FloatingActionButton(
                                backgroundColor: const Color(0xFF4C4F5E),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: const Icon(FontAwesomeIcons.minus,
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Reusable_card(
                      color: const Color(0xFF1D1E33),
                      Cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE",
                            style: TextStyle(
                              color: Color(0xFF8D8E98),
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                age.toString(),
                                style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                backgroundColor: const Color(0xFF4C4F5E),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: const Icon(FontAwesomeIcons.plus,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              FloatingActionButton(
                                backgroundColor: const Color(0xFF4C4F5E),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: const Icon(FontAwesomeIcons.minus,
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottombutton(
              buttontitle: "CALCULATE",
              onTap: () {
                CalulatorBrain calc =
                    CalulatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Results(
                              bmiresult: calc.calculateBMI(),
                              resulttext: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              },
            ),
          ],
        ));
  }
}

class bottombutton extends StatelessWidget {
  bottombutton({required this.onTap, required this.buttontitle});

  final VoidCallback onTap;
  final String buttontitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70.0,
        margin: EdgeInsets.only(top: 10.0),
        child: Center(
            child: Text(
          buttontitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        )),
        color: Color(0xFFEB1555),
      ),
    );
  }
}
