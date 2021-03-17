import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalkulator/my_buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class Kalkulator extends StatefulWidget {
  @override
  _KalkulatorState createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  var userInput = '';
  var answerUser = '';

  List<String> buttons = [
    'AC',
    'C',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    '00',
    '=',
  ];

  // bool operator
  bool isOperators(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    } else {
      return false;
    }
  }

  // equalOperators
  void isEqualOperators() {
    String finalUserInput = userInput;
    finalUserInput = finalUserInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    answerUser = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    userInput,
                    style: GoogleFonts.rubik(
                      fontSize: 24,
                      color: Colors.black54,
                    ),
                  ),
                  alignment: Alignment(1, 1),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Text(
                    answerUser,
                    style: GoogleFonts.rubik(
                      fontSize: 42,
                      color: Colors.black,
                    ),
                  ),
                  alignment: Alignment(1, 1),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (_, int index) {
                    // buttons AC
                    if (index == 0) {
                      return MyButtons(
                        buttonTap: () {
                          setState(() {
                            userInput = '';
                            answerUser = '';
                          });
                        },
                        color: Colors.blueGrey[50],
                        buttonText: buttons[index],
                        textColor: Colors.green[800],
                      );
                    }
                    // buttons C
                    else if (index == 1) {
                      return MyButtons(
                        buttonTap: () {
                          setState(() {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                          });
                        },
                        color: Colors.blueGrey[50],
                        buttonText: buttons[index],
                        textColor: Colors.red[800],
                      );
                    }

                    // equalOperator
                    else if (index == buttons.length - 1) {
                      return MyButtons(
                        buttonTap: () {
                          setState(() {
                            isEqualOperators();
                          });
                        },
                        color: Colors.blueGrey[50],
                        buttonText: buttons[index],
                        textColor: (isOperators(buttons[index])
                            ? Colors.blue
                            : Colors.black),
                      );
                    }

                    // buttons number
                    else {
                      return MyButtons(
                        buttonTap: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        color: Colors.blueGrey[50],
                        buttonText: buttons[index],
                        textColor: (isOperators(buttons[index])
                            ? Colors.blue
                            : Colors.black),
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
