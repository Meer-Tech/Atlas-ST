import 'package:flutter/material.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons({
    super.key,
    required this.imageUrl,
    this.onPressed,
  });

  final String imageUrl;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Image.network(
          imageUrl,
          width: 24,
          height: 24,
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.g_mobiledata,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
