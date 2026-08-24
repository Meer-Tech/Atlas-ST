import 'package:go_router/go_router.dart';

import '../../features/auth/forget_psw/screens/forget_psw_page.dart';
import '../../features/auth/login/screens/login_page.dart';
import '../../features/auth/signup/screens/sign_up_page.dart';
import '../../features/landing/screens/landing_page.dart';
import '../../features/home/screens/home_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LandingPage()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/signup', builder: (context, state) => const SignUpPage()),
    GoRoute(path: '/forgotpsw', builder: (context, state) => const ForgetPswPage()),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
  ],
);
