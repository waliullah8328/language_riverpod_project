import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:language_riverpod_project/feature/route/routes_name.dart';

import '../../../core/utils/constants/image_path.dart';


class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  //late final AuthenticationRepository _authService;

  @override
  void initState() {
    super.initState();
    //_authService = AuthenticationRepository();
    _navigateUser();
  }

  Future<void> _navigateUser() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    context.go(RouteNames.welcomeScreen);

   // final loggedIn = await _authService.isLoggedIn();
   //  final isOnBoarding = await TokenStorage.hasSeenOnboarding();
   //
   //  debugPrint("Is Onboarding value : $isOnBoarding");
   //  debugPrint("Is Logged In : $loggedIn");




    // if (isOnBoarding) {
    //   if (loggedIn) {
    //     Navigator.pushReplacementNamed(
    //       context,
    //       RouteNames.bottomNavScreen,
    //     );
    //   } else {
    //     Navigator.pushReplacementNamed(
    //       context,
    //       RouteNames.welcomeScreen,
    //     );
    //   }
    // } else {
    //   Navigator.pushReplacementNamed(
    //     context,
    //     RouteNames.onBoardingScreen,
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          ImagePath.splashLogoImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
