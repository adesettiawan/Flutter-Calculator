import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButtons extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final Function buttonTap;

  MyButtons({this.color, this.textColor, this.buttonText, this.buttonTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: color,
              child: Center(
                child: Text(
                  buttonText,
                  style: GoogleFonts.rubik(
                    fontSize: 20,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
