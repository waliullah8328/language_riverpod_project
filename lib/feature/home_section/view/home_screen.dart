import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_riverpod_project/core/utils/constants/app_sizer.dart';

import '../../../core/utils/constants/image_path.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});




  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Scaffold(

        appBar: AppBar(

          leading: Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Image.asset(ImagePath.appLogoImage), // Adjust image path
          ),
          title: Text(
            "Home",
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
          ),
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                // if (value == 'map') {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => LiveRouteScreen()),
                //   );
                // }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'map',
                  child: Text("Map"),
                ),
              ],
            ),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.only(left: 16.w,right: 16.w,bottom: 16.h,top: 10.h),
            child: Column(
                children: [
                  // Consumer(builder: (context, ref, child) {
                  //   final userList = ref.watch(getMeProvider);
                  //   return  userList.when(
                  //     data: (data) {
                  //       return GestureDetector(
                  //         onTap: (){
                  //           Navigator.pushNamed(context, RouteNames.achievementsScreen);
                  //         },
                  //         child: Container(
                  //           padding: EdgeInsets.all(16),
                  //           decoration: BoxDecoration(
                  //               border: Border.all(width: 1.w,color: isDarkMode?Color(0xff353434):AppColors.textWhite),
                  //               color: isDarkMode?Color(0xff353434):AppColors.textWhite,
                  //               borderRadius: BorderRadius.circular(8)
                  //
                  //           ),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Expanded(
                  //                 child: Row(
                  //                   children: [
                  //                     Image.asset(ImagePath.levelImage, height: 60.h, width: 60.w),
                  //                     SizedBox(width: 16.w),
                  //                     Expanded( // 👈 allows text to wrap nicely
                  //                       child: Column(
                  //                         crossAxisAlignment: CrossAxisAlignment.start,
                  //                         children: [
                  //                           CustomText(
                  //                             text: "${_getText(AppLocale.level, currentLangCode)} ${data.userLevel}",
                  //                             fontSize: 18.sp,
                  //                             fontWeight: FontWeight.w600,
                  //                             textOverflow: TextOverflow.ellipsis,
                  //                           ),
                  //                           SizedBox(height: 6.h),
                  //                           CustomText(
                  //                             text: _getText(AppLocale.risingStar, currentLangCode),
                  //                             fontSize: 12.sp,
                  //                             fontWeight: FontWeight.w400,
                  //                             maxLines: 2,
                  //                             textOverflow: TextOverflow.ellipsis,
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //               Image.asset(
                  //                 IconPath.rightArrowIcon,
                  //                 height: 24.h,
                  //                 width: 24.w,
                  //                 color: isDarkMode ? AppColors.textWhite : null,
                  //               ),
                  //             ],
                  //           ),
                  //
                  //         ),
                  //       );
                  //
                  //     },
                  //     error: (error,stack)=> GestureDetector(
                  //       onTap: (){
                  //         Navigator.pushNamed(context, RouteNames.achievementsScreen);
                  //       },
                  //       child: Container(
                  //         padding: EdgeInsets.all(16),
                  //         decoration: BoxDecoration(
                  //             border: Border.all(width: 1.w,color: isDarkMode?Color(0xff353434):AppColors.textWhite),
                  //             color: isDarkMode?Color(0xff353434):AppColors.textWhite,
                  //             borderRadius: BorderRadius.circular(8)
                  //
                  //         ),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Expanded(
                  //               child: Row(
                  //                 children: [
                  //                   Image.asset(ImagePath.levelImage, height: 60.h, width: 60.w),
                  //                   SizedBox(width: 16.w),
                  //                   Expanded( // 👈 allows text to wrap nicely
                  //                     child: Column(
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         CustomText(
                  //                           text: "${_getText(AppLocale.level, currentLangCode)} 1",
                  //                           fontSize: 18.sp,
                  //                           fontWeight: FontWeight.w600,
                  //                           textOverflow: TextOverflow.ellipsis,
                  //                         ),
                  //                         SizedBox(height: 6.h),
                  //                         CustomText(
                  //                           text: _getText(AppLocale.risingStar, currentLangCode),
                  //                           fontSize: 12.sp,
                  //                           fontWeight: FontWeight.w400,
                  //                           maxLines: 2,
                  //                           textOverflow: TextOverflow.ellipsis,
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Image.asset(
                  //               IconPath.rightArrowIcon,
                  //               height: 24.h,
                  //               width: 24.w,
                  //               color: isDarkMode ? AppColors.textWhite : null,
                  //             ),
                  //           ],
                  //         ),
                  //
                  //       ),
                  //     ),
                  //     loading: () => levelShimmer(isDarkMode: isDarkMode),
                  //   );
                  //
                  // },)
                  //
                  // ,
                  SizedBox(height: 20.h,),
                  // Container(
                  //   padding: EdgeInsets.all(16),
                  //   decoration: BoxDecoration(
                  //       border: Border.all(width: 1.w,color: isDarkMode?Color(0xff353434):AppColors.textWhite),
                  //       color:AppColors.textWhite,
                  //       borderRadius: BorderRadius.circular(8)
                  //
                  //   ),
                  //   child: Column(
                  //     children: [
                  //       CustomAccountButton(iconPath: IconPath.waterTrackerIcon, title: _getText(AppLocale.waterTracker, currentLangCode),onTap: (){
                  //         Navigator.pushNamed(context, RouteNames.waterTrackerScreen);
                  //       },isDarkMode: isDarkMode,),
                  //       SizedBox(height: 20.h,),
                  //       CustomAccountButton(iconPath: IconPath.weightTrackerIcon, title: _getText(AppLocale.weightTracker, currentLangCode),onTap: (){
                  //         Navigator.push(context, MaterialPageRoute(builder: (context)=> WeightTrackerScreen ()));
                  //       },isDarkMode: isDarkMode,),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 20.h,),
                  // Card(
                  //     elevation: 0,
                  //
                  //
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(16.0),
                  //       child: Column(
                  //           children: [
                  //             CustomAccountButton(iconPath: IconPath.appAppearanceIcon, title: "App Appearance",onTap: (){
                  //               //Navigator.pushNamed(context, RouteNames.preferencesScreen);
                  //             },)]),
                  //     )),
                ]
            )));
    //                 SizedBox(height: 20.h,),
    //                 CustomAccountButton(iconPath: IconPath.profileIcon, title: _getText(AppLocale.personalInfo, currentLangCode),onTap: (){
    //                  // Navigator.pushNamed(context, RouteNames.personalInfoScreen);
    //                 },),
    //                 SizedBox(height: 20.h,),
    //                 CustomAccountButton(iconPath: IconPath.securityIcon, title: _getText(AppLocale.accountAndSecurity, currentLangCode),onTap: (){
    //                   Navigator.pushNamed(context, RouteNames.accountSecurityScreen);
    //                 }),
    //                 SizedBox(height: 20.h,),
    //                 //CustomAccountButton(iconPath: IconPath.linkedAccountIcon, title: _getText(AppLocale.linkedAccount, currentLangCode),onTap: (){},isDarkMode: isDarkMode,),
    //                 //SizedBox(height: 20.h,),
    //                 CustomAccountButton(iconPath: IconPath.eyeIcon, title: _getText(AppLocale.appAppearance, currentLangCode),onTap: (){
    //                  // Navigator.pushNamed(context, RouteNames.appAppearanceScreen);
    //                 ),
    //                 SizedBox(height: 20.h,),
    //                 // CustomAccountButton(iconPath: IconPath.dataAnalyticsIcon, title:  _getText(AppLocale.dataAndAnalysis, currentLangCode),onTap: (){
    //                 //   Navigator.pushNamed(context, RouteNames.dataAndAnalytics);
    //                 // },isDarkMode: isDarkMode,),
    //                 // SizedBox(height: 20.h,),
    //                 CustomAccountButton(iconPath: IconPath.helpAndSupportIcon, title: _getText(AppLocale.helpAndSupport, currentLangCode),onTap: (){
    //                   //Navigator.pushNamed(context, RouteNames.helpAndSupportScreen);
    //                 },),
    //                 SizedBox(height: 20.h,),
    //                 GestureDetector(
    //                   onTap: (){
    //                     // showModalBottomSheet(
    //                     //   context: context,
    //                     //   isScrollControlled: true,
    //                     //   backgroundColor: Colors.transparent,
    //                     //   builder: (context) => const LogoutBottomSheet(),
    //                     // );
    //                   },
    //                   child: Row(
    //                     children: [
    //                       Image.asset(IconPath.logOutIcon,height: 24.h,width: 24.w,),
    //                       SizedBox(width: 20.w,),
    //                    //   CustomText(text: _getText(AppLocale.logOut, currentLangCode),fontSize: 16.sp,fontWeight: FontWeight.w700,color: Color(0xffF75555),)
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //
    //         ],
    //       ),
    //     ),
    //   );
    // }]

  }
}