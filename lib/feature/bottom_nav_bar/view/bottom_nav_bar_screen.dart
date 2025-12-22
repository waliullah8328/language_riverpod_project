// lib/bottom_nav/view/bottom_nav_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_riverpod_project/core/utils/constants/app_sizer.dart';
import 'package:language_riverpod_project/core/utils/constants/icon_path.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../l10n/app_localizations.dart';
import '../../account_section/account/view/account_screen.dart';
import '../../home_section/view/home_screen.dart';
import '../view_model/bottom_nav_bar_view_model.dart';

class BottomNavScreen extends ConsumerWidget {
  const BottomNavScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("Build");





    final List<Widget> pages = [
      const HomeScreen (),
      const AccountScreen(),
      const AccountScreen(),
      const AccountScreen(),


    ];

    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final currentIndex = ref.watch(bottomNavProvider);
        return pages[currentIndex];
      },),
      bottomNavigationBar: Container(
        height: 92.h,
        decoration: const BoxDecoration(


        ),
        child: Consumer(builder: (context, ref, child) {
          final currentIndex = ref.watch(bottomNavProvider);
          final notifier = ref.read(bottomNavProvider.notifier);
          return BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: notifier.setIndex,

            selectedLabelStyle: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w700),
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,


            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(currentIndex == 0?IconPath.homeActiveIcon:IconPath.homeInActiveIcon,height: 18.h,width: 18.w,),

                label: AppLocalizations.of(context)!.home,


              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(currentIndex == 1?IconPath.reportActiveIcon:IconPath.reportInActiveIcon,height: 18.h,width: 18.w,),

                label: AppLocalizations.of(context)!.report,


              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(currentIndex == 2?IconPath.historyActiveIcon:IconPath.historyInActiveIcon,height: 18.h,width: 18.w,),

                label: AppLocalizations.of(context)!.history,


              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(currentIndex == 3?IconPath.accountActiveIcon:IconPath.accountInActiveIcon,height: 18.h,width: 18.w,),

                label: AppLocalizations.of(context)!.account,


              ),

            ],
          );
        },),
      ),
    );
  }
}
