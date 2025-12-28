import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:language_riverpod_project/core/utils/constants/app_sizer.dart';
import 'package:language_riverpod_project/feature/route/routes_name.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../../core/utils/theme/theme_provider.dart';
import '../../core/common/widgets/custom_text.dart';
import '../../core/common/widgets/new_custon_widgets/custom_primary_button.dart';
import '../../core/common/widgets/new_custon_widgets/custom_secondary_button.dart';
import '../../core/common/widgets/new_custon_widgets/social_login.dart';
import '../../core/utils/constants/icon_path.dart';
import '../../core/utils/constants/image_path.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});




  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final themeMode = ref.watch(themeModeProvider);


// ✅ Detect dark mode correctly
    final brightness = MediaQuery.of(context).platformBrightness;

    final isDarkMode = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system && brightness == Brightness.dark);
    return Scaffold(
      backgroundColor: isDarkMode?Color(0xff212121):AppColors.textWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.only(left: 24.w,right: 24.w),
            child: Column(

              children: [
                SizedBox(height: 30.h,),
                Align(
                    alignment: Alignment.center,
                    child: Image.asset(ImagePath.appCircleLogoImage,width: 100.w,height: 120.h,)),
                SizedBox(height: 30.h,),
                CustomText(text: "Let's Get Started!",fontSize: 26.sp,fontWeight: FontWeight.bold,),
                SizedBox(height: 12.h,),
                CustomText(text: "Let's dive in into your account",fontSize: 13.sp,fontWeight: FontWeight.w400,),
                SizedBox(height: 40.h,),
                CustomSocialLogin(title:  "Continue with Google",iconPath: IconPath.googleSignInIcon,onTap: (){},),
                SizedBox(height: 20.h,),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.w,color: Color(0xffEEEEEE)),
                        borderRadius: BorderRadius.circular(99)
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          IconPath.appleSignInIcon,
                          colorFilter: isDarkMode
                              ? const ColorFilter.mode(
                            AppColors.textWhite,
                            BlendMode.srcIn,
                          )
                              : null,
                        ),
                        Expanded(child: Center(child: CustomText(text: "Continue with Apple",fontSize: 16.sp,fontWeight: FontWeight.w600,)))

                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 20.h,),
                // CustomSocialLogin(title: _getText(AppLocale.facebookButtonText, currentLangCode),iconPath: IconPath.facebookIcon,onTap: (){},),
                // SizedBox(height: 20.h,),
                // CustomSocialLogin(title: _getText(AppLocale.twitterButtonText, currentLangCode),iconPath: IconPath.twitterIcon,onTap: (){},),
                SizedBox(height: 40.h,),
                CustomPrimaryButton(title: "Sign up",onPressed: (){
                  context.push(RouteNames.signUpScreen);
                },),
                SizedBox(height: 20.h,),
                CustomSecondaryButton(title: "Sign in",onPressed: (){
                 context.push(RouteNames.loginScreen);
                },),
                SizedBox(height: 39.h,),
                CustomText(text: "Privacy Policy  .  Terms of Service",fontSize: 14.sp,fontWeight: FontWeight.w400,)



              ],
            ),
          ),
        ),
      ),
    );
  }
}