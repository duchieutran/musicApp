import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music/config/routes/app_routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // kích thước mặc định để căn chỉnh
      minTextAdapt: true, // cho phép thay đổi kích thước chữ từng tỉ lệ
      splitScreenMode: true,
      child: MaterialApp(
        onGenerateRoute: AppRoutes.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor:
                  Colors.lightBlue), // màu xuyên suốt trong toàn bộ ứng dụng
          useMaterial3: true, // sử dụng Material3
        ),
      ),
    );
  }
}
