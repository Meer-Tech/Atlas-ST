import 'package:flutter/material.dart';

class Devider extends StatelessWidget {
  const Devider({super.key, required this.deviderText, this.color});

  final String deviderText;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: Color(0xffA9A9A9),
            thickness: 0.5,
            indent: 30,
            endIndent: 10,
          ),
        ),
        Text(
          deviderText,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: color,
            fontFamily: 'HankenGrotesk'
          ),
        ),
        Expanded(
          child: Divider(
            color: Color(0xffA9A9A9),
            thickness: 0.5,
            indent: 10,
            endIndent: 30,
          ),

        ),
      ],
    );
  }
}
