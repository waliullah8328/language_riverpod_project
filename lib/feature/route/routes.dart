
import 'package:go_router/go_router.dart';
import 'package:language_riverpod_project/feature/bottom_nav_bar/view/bottom_nav_bar_screen.dart';
import 'package:language_riverpod_project/feature/route/routes_name.dart';

import '../authentication/login/view/login_screen.dart';
import '../authentication/otp/view/otp_screen.dart';
import '../authentication/sign_up/view/sign_up_screen.dart';







class Routes{

  static final GoRouter goRouter = GoRouter(
    debugLogDiagnostics: true,
      initialLocation: RouteNames.signUpScreen,
      routes: [
        GoRoute(
            path: RouteNames.splashScreen,
          builder: (context, state) => BottomNavScreen(),
        ),
        GoRoute(
            path: RouteNames.signUpScreen,
          builder: (context, state) => SignUpScreen (),
        ),
        GoRoute(
            path: RouteNames.otpScreen,
          builder: (context, state) => OtpScreen(),
        ),
        GoRoute(
            path: RouteNames.loginScreen,
          builder: (context, state) => LoginScreen(),
        ),
      ]
  );
}