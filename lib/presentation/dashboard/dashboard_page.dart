import 'package:edsp_final3/core/values/colors.dart';
import 'package:edsp_final3/presentation/dashboard/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_controller.dart';
import 'discussion/discussion_page.dart';
import 'home/home_page.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int selectedIndex = controller.selectedNavIndexObs.value;
      return SafeArea(
        child: Scaffold(backgroundColor: AppColors.background,
          // body: _bodyList()[selectedIndex],
          body: IndexedStack(
            index: selectedIndex,
            children: const [
              HomePage(),
              DiscussionPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              controller.navigateTo(index);
            },
            items:  [
              BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/ic_home.png',
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/icons/ic_quiz.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
            label: 'Diskusi',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: AppColors.primary,
            ),
            label: 'Profile',
          ),
            ],
          ),
        ),
      );
    });
  }

  List<Widget> _bodyList() => [
        const HomePage(),
        const DiscussionPage(),
        const ProfilePage(),
      ];
}
