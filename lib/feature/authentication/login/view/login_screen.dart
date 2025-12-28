import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_svg/svg.dart';
import 'package:language_riverpod_project/core/utils/constants/app_sizer.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/new_custon_widgets/custom_check_box_widget.dart';
import '../../../../core/common/widgets/new_custon_widgets/custom_primary_button.dart';
import '../../../../core/common/widgets/new_custon_widgets/custom_text_form_field.dart';
import '../../../../core/common/widgets/new_custon_widgets/social_login.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/theme/theme_provider.dart';
import '../../../../core/utils/validators/app_validator.dart';
import '../view_model/login_view_model.dart';



final presentPasswordVisibilityProvider = StateProvider<bool>((ref) => false);
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  @override
  void initState() {
    super.initState();

    /// 🔥 AUTO-FILL SAVED EMAIL & PASSWORD
    Future.delayed(Duration.zero, () {
      final loginState = ref.read(loginProvider);

      _emailController.text = loginState.email;
      _passwordController.text = loginState.password;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build login");



    final themeMode = ref.watch(themeModeProvider);

    final brightness = MediaQuery.of(context).platformBrightness;

    final isDarkMode = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system && brightness == Brightness.dark);

    return Scaffold(

      appBar: AppBar(

        title: Text(
          "Sign in",
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 25,
            weight: 1.w,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
          child: Form(
            key: _loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back! ",
                  style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600),
                ),

                SizedBox(height: 8.h),

                CustomText(
                  text: "Sign in to continue your fitness journey.",
                  color: isDarkMode ? AppColors.textWhite : AppColors.textGrey,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),

                SizedBox(height: 30.h),

                /// EMAIL
                CustomText(
                  text: "Email",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),

                SizedBox(height: 8.h),

                CustomTextField(
                  controller: _emailController,
                  hintText: "Email",
                  validator: AppValidator.validateEmail,
                  onChanged: (email) {
                    ref.read(loginProvider.notifier).updateEmail(email);


                  },
                  prefixIcon: SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: Center(
                      child: SvgPicture.asset(
                        IconPath.emailIcon,
                        colorFilter: isDarkMode
                            ? const ColorFilter.mode(
                          AppColors.textWhite,
                          BlendMode.srcIn,
                        )
                            : null,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16.h),

                /// PASSWORD
                CustomText(
                  text: "Password",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),

                SizedBox(height: 8.h),


                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  validator: AppValidator.validatePassword,
                  onChanged: (password) {
                    ref.read(loginProvider.notifier).updatePassword(password);

                    /// 🔥 If checkbox is unchecked remove saved password

                  },
                  prefixIcon: SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: Center(
                      child: SvgPicture.asset(
                        IconPath.passwordIcon,
                        colorFilter: isDarkMode
                            ? const ColorFilter.mode(
                          AppColors.textWhite,
                          BlendMode.srcIn,
                        )
                            : null,
                      ),
                    ),
                  ),
                  visibilityProvider: presentPasswordVisibilityProvider,
                ),

                SizedBox(height: 16.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Consumer(builder: (context, ref, child) {
                          final termsAccepted = ref.watch(loginProvider.select((s)=>s.termsAccepted));
                          return CustomCheckBoxWidget(
                            value: termsAccepted,
                            onChanged: (value) {
                              ref.read(loginProvider.notifier).toggleTermsAccepted();


                            },
                          );
                        },),
                        Text("Remember me"),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                       // Navigator.pushNamed(context, RouteNames.forgetPasswordScreen);
                      },
                      child: CustomText(
                        text: "Forgot Password?",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff16A8AD),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                Row(
                  children: [
                    Expanded(child: Divider(height: 1.h, color: const Color(0xffEEEEEE))),
                    SizedBox(width: 16.w),
                    Text("or",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(child: Divider(height: 1.h, color: const Color(0xffEEEEEE))),
                  ],
                ),

                SizedBox(height: 15.h),

                CustomSocialLogin(
                  title: "Continue with Google",
                  iconPath: IconPath.googleSignInIcon,
                  onTap: () {},
                ),

                SizedBox(height: 15.h),

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

                // SizedBox(height: 15.h),
                //
                // CustomSocialLogin(
                //   title: _getText(AppLocale.facebookButtonText, currentLangCode),
                //   iconPath: IconPath.facebookIcon,
                //   onTap: () {},
                // ),
                //
                // SizedBox(height: 15.h),
                //
                // CustomSocialLogin(
                //   title: _getText(AppLocale.twitterButtonText, currentLangCode),
                //   iconPath: IconPath.twitterIcon,
                //   onTap: () {},
                // ),

                SizedBox(height: 50.h),
                Consumer(
                  builder: (context, ref, child) {
                    //final isLoading = ref.watch(loginProvider.select((s) => s.isLoading));

                    return CustomPrimaryButton(
                      title:"Sign in",
                      onPressed: () async {
                        if (!_loginFormKey.currentState!.validate()) return;

                      },
                    );
                  },
                )



                /// LOGIN BUTTON
                ,

                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
