import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music/config/routes/app_routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // màn hình splash tự động vào màn hình home sau 3s
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(context, AppRoutes.screen),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '🙂‍↔️ MUSIC DAY 🙂‍↔️',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold),
                ),
                const Image(
                    image: AssetImage('assets/images/splash/splash.gif')),
                Text(
                  'Trần Đức Hiếu ❤️',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                )
              ],
            )));
  }
}
