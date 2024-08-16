import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music/screens/discovery/discovery.dart';
import 'package:music/screens/home/home.dart';
import 'package:music/screens/profile/profile.dart';
import 'package:music/screens/settings/setting.dart';
import 'package:music/screens/stores/navigator/navigator_store.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  PageController controller = PageController();
  final navigatorstore = NavigatorStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        // chú ý item và PageView
        children: const [
          Home(),
          Discovery(),
          Profile(),
          Setting(),
        ],
      ),
      bottomNavigationBar: Observer(
        builder: (context) => SlidingClippedNavBar(
          backgroundColor: const Color.fromARGB(255, 92, 198, 247), // màu nền
          onButtonPressed: (index) {
            navigatorstore.setIndex(index);
            controller.animateToPage(navigatorstore.indexCurrent,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          iconSize: 27.sp,
          activeColor: Colors.blue.shade100, // màu lable khi chọn
          inactiveColor: Colors.white, // đổi màu icon
          selectedIndex: navigatorstore.indexCurrent,
          // dùng barItems để thêm item
          barItems: [
            BarItem(
              icon: Icons.home,
              title: 'Home',
            ),
            BarItem(
              icon: Icons.album,
              title: 'Discovery',
            ),
            BarItem(
              icon: Icons.person,
              title: 'Profile',
            ),
            BarItem(
              icon: Icons.settings,
              title: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
