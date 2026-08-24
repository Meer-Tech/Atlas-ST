import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/services/auth_service.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_button_outlined.dart';
import '../../common_widgets/text_form_widget.dart';

class ForgetPswPage extends StatefulWidget {
  const ForgetPswPage({super.key});

  @override
  State<ForgetPswPage> createState() => _ForgetPswPageState();
}

class _ForgetPswPageState extends State<ForgetPswPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomBackground(),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 100.0,
                  right: 24,
                  left: 24,
                  bottom: 24,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recover',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontFamily: 'HankenGrotesk',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Enter your registered E-mail address, and w'll send you a link to reset you password",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'HankenGrotesk',
                      ),
                    ),
                    SizedBox(height: 100),
                    TextFormWidget(
                      controller: _emailController,
                      iconName: Iconsax.direct_right,
                      label: 'E-Mail',
                    ),
                    SizedBox(height: 24),
                    CustomButton(
                      text: 'Submit',
                      onTap: () async {
                        await AuthService().sendPasswordResetEmail(
                          _emailController.text.trim(),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Password Reset Email Sent')),
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    CustomButtonOutlined(
                      text: 'Back to Login',
                      onTap: () {
                        context.pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
