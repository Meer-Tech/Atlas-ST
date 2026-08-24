import 'dart:ui';

import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset('assets/bi/ji.png', fit: BoxFit.fill),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1000, sigmaY: 1000),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white.withValues(alpha: 0),
            ),
          ),
        ),
      ],
    );
  }
}
