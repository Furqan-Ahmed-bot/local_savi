// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_saviors/utils/routes/routes.dart';
import 'package:local_saviors/utils/routes/screen_bindings.dart';

import 'utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme:
                AppBarTheme(elevation: 0, surfaceTintColor: Colors.transparent),
            applyElevationOverlayColor: false,
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            useMaterial3: true,
            fontFamily: GoogleFonts.roboto().fontFamily,
          ),
          // home: MainScreen(),
          getPages: AppRoutes.appRoutes(),
          initialBinding: ScreenBindings(),
          initialRoute: RouteName.jobCompletedScreenPath,
        );
      },
    );
  }
}
