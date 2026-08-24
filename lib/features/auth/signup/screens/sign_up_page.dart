import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/services/auth_service.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../common_widgets/auth_buttons.dart';
import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_button_outlined.dart';
import '../../common_widgets/devider.dart';
import '../../common_widgets/text_form_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Text(
                      'Join Us',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontFamily: 'HankenGrotesk',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Create your account to start\nyour intellectual journey',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'HankenGrotesk',
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormWidget(
                            controller: _firstNameController,
                            iconName: Iconsax.user,
                            label: 'First Name',
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextFormWidget(
                            controller: _lastNameController,
                            iconName: Iconsax.user,
                            label: 'Last Name',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    TextFormWidget(
                      controller: _emailController,
                      iconName: Iconsax.direct,
                      label: 'E-Mail',
                    ),
                    SizedBox(height: 16),
                    TextFormWidget(
                      controller: _passwordController,
                      iconName: Iconsax.password_check,
                      label: 'Password',
                      iconNameOptional: Iconsax.eye_slash,
                      obscureText: true,
                    ),
                    SizedBox(height: 24),
                    CustomButton(
                      text: 'Sign Up',
                      onTap: () async {
                        final user = await AuthService().registerWithEmailAndPassword(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                        );
                        if (user != null) {
                          context.go('/home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Registration Failed')),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 16),
                    CustomButtonOutlined(
                      text: 'Back to Login',
                      onTap: () {
                        context.pop();
                      },
                    ),
                    SizedBox(height: 24),
                    Devider(deviderText: 'OR', color: Colors.white70),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuthButtons(
                          imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png',
                          onPressed: () async {
                            final user = await AuthService().signInWithGoogle();
                            if (user != null) {
                              context.go('/');
                            }
                          },
                        ),
                        SizedBox(width: 16),
                        AuthButtons(
                          imageUrl:
                              "https://cdn-icons-png.flaticon.com/512/25/25231.png",
                        ),
                      ],
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
