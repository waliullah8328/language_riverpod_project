import 'package:go_router/go_router.dart';
import 'package:language_riverpod_project/feature/bottom_nav_bar/view/bottom_nav_bar_screen.dart';
import 'package:language_riverpod_project/feature/route/routes_name.dart';
import 'package:language_riverpod_project/feature/splash/view/splash_screen.dart';

import '../authentication/login/view/login_screen.dart';
import '../authentication/otp/view/otp_screen.dart';
import '../authentication/reset_password/view/reset_password.dart';
import '../authentication/sign_up/view/sign_up_screen.dart';
import '../on_boarding/welcome_screen.dart';

class Routes {
  static final GoRouter goRouter = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: RouteNames.splashScreen,
    routes: [
      GoRoute(
        path: RouteNames.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.navBarScreen,
        builder: (context, state) => BottomNavScreen(),
      ),
      GoRoute(
        path: RouteNames.signUpScreen,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: "${RouteNames.otpScreen}/:email",
        builder: (context, state) =>
            OtpScreen(email: state.pathParameters["email"] ?? ""),
      ),
      GoRoute(
        path: RouteNames.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.navBarScreen,
        builder: (context, state) => BottomNavScreen(),
      ),
      GoRoute(
        path: RouteNames.welcomeScreen,
        builder: (context, state) => WelcomeScreen(),
      ),
      GoRoute(
        path: "${RouteNames.resetPasswordScreen}/:email/:otp",
        builder: (context, state) {
          String email = state.pathParameters['email']??'';
          String otp = state.pathParameters['otp']??'';
          return ResetPasswordScreen(email: email, otp: otp,);
        },
      ),
    ],
  );
}
