
import 'package:flutter/material.dart';
import 'home_course.dart';
import 'home_profile.dart';
import 'home_top_banner.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.shortestSide < 600;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const HomeProfileWidget(),
        const HomeTopBannerWidget(),
        const HomeCoursesWidget(),
        Container(
          height: 100,
          color: Colors.white,
          child: const Text('Matematika'),
        ),


      ],
    );
  }

  Widget _mobileWidget() {
    return Container();
  }

  Widget _tabletWidget() {
    return Container();
  }

  Widget _landscapeWidget() {
    return Container();
  }
}