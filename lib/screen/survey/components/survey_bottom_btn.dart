import 'package:flutter/material.dart';

class SurveyBottomBtn extends StatelessWidget {
  const SurveyBottomBtn(
      {required this.text,
      required this.textColor,
      required this.backgroundColor,
      required this.onPressed,
      super.key});
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: textColor),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(
            color: Color(0xffAAAAAA),
            width: 1,
          ),
        ),
      ),
    );
  }
}
