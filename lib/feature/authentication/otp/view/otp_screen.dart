import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:language_riverpod_project/core/utils/constants/app_sizer.dart';
import 'package:language_riverpod_project/feature/route/routes_name.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizes.dart';

import '../../../../core/common/widgets/new_custon_widgets/custom_primary_button.dart';
import '../../../../core/utils/theme/theme_provider.dart';

import '../view_model/verify_view_model.dart';


class OtpScreen extends ConsumerWidget {
  const OtpScreen( {super.key,required this.email,});

  final String email;




  @override
  Widget build(BuildContext context, WidgetRef ref) {



    final notifier = ref.read(otpNotifierProvider.notifier);
    final themeMode = ref.watch(themeModeProvider);


// ✅ Detect dark mode correctly
    final brightness = MediaQuery.of(context).platformBrightness;

    final isDarkMode = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system && brightness == Brightness.dark);

    debugPrint("-------------------------------------Mode--------------------------------");
    debugPrint(ThemeMode.light.toString());
    debugPrint(isDarkMode.toString());
    debugPrint(themeMode.toString());

    return Scaffold(

      appBar: AppBar(
        title: Text("OTP",style: TextStyle(fontWeight: FontWeight.w600),),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back,size: 25,weight: 1.w,),
        //   onPressed: () => Navigator.pop(context),
        // ),
      ),
      body: Column(

        children: [

          Padding(
            padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter OTP Code",
                  style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.h),
                CustomText(text: "Check your email inbox for a one-time passcode (OTP) from TrackFit. Enter the code below to continue.",color: isDarkMode?AppColors.textWhite:AppColors.textGrey,fontSize:13.sp ,fontWeight: FontWeight.w400,),
                SizedBox(height: 30.h),

                /// OTP FIELD
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  cursorColor: const Color(0xFF007AFF),
                  keyboardType: TextInputType.number,
                  enableActiveFill: true, // allows background color to be shown
                  backgroundColor: Colors.transparent, // keep overall background clear

                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 60.h,
                    fieldWidth: 60.w,
                    borderWidth: 1.5.w,
                    inactiveColor: Colors.grey.shade300, // border when inactive
                    selectedColor: const Color(0xFF007AFF), // border when focused
                    activeColor: const Color(0xFF007AFF), // border when active
                    inactiveFillColor: isDarkMode?Color(0xff353434) :Color(0xFFFAFAFA), // background color
                    selectedFillColor: isDarkMode?Color(0xff7F27FF).withValues(alpha: 0.08):Color(0xFFFAFAFA),
                    activeFillColor: isDarkMode?Color(0xff353434) :Color(0xFFFAFAFA),
                  ),

                  onChanged: (value) {
                    notifier.setOtp(value);
                  },
                ),


                SizedBox(height: getWidth(20)),

                /// RESEND TIMER
                Consumer(builder: (context, ref, child) {
                  final state = ref.watch(otpNotifierProvider);
                  return Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: isDarkMode?AppColors.textWhite:Color(0xff616161)),
                        text: "You can resend the code in ",
                        children: [
                          TextSpan(
                            text:
                            state.remainingTime.toString().padLeft(2, '0'),
                            style:TextStyle(color: isDarkMode?AppColors.primary:Colors.black),
                          ),
                          TextSpan(
                            text:
                            " seconds",
                            style:  TextStyle(color: isDarkMode?AppColors.textWhite:Color(0xff616161)),
                          ),
                        ],
                      ),
                    ),
                  );
                },),
                SizedBox(height: 10.h,),
                Consumer(builder: (context, ref, child) {
                  final state = ref.watch(otpNotifierProvider);
                  return Align(
                    alignment: Alignment.center,
                    child: state.enableResend
                        ?TextButton(
                      onPressed: () async {

                      },
                      child:  Text("Resend code",style: TextStyle(color: isDarkMode?AppColors.textWhite:AppColors.primary),),
                    ):TextButton(
                      onPressed: () {},
                      child:  Text("Resend code",style: TextStyle(color: Color(0xff616161)),),
                    ),
                  );
                },)
                ,
              ],
            ),
          ),

          Spacer(),

          /// VERIFY BUTTON

          Divider(
            height: 1.h,
            color:  const Color(0xffF5F5F5),
          ),
          Consumer(builder: (context, ref, child) {
            final otp = ref.watch(otpNotifierProvider.select((s)=>s.otp));

            return Padding(
              padding:  EdgeInsets.only(left: 24.w,right: 24.w,bottom: 40.h,top: 24.h),
              child:CustomPrimaryButton(
                title:"Verify",onPressed: () async {
                  context.go("${RouteNames.resetPasswordScreen}/$email/$otp");
                  debugPrint(email.toString());








              },),
            );
          },)

          ,
        ],
      ),
    );
  }
}
