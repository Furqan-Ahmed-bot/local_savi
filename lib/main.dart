// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_saviors/controllers/professional_controllers/p_home_controller.dart';
import 'package:local_saviors/resources/components/imagepicker_component.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/routes/routes.dart';
import 'package:local_saviors/utils/routes/screen_bindings.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'controllers/user_controllers/home_screen_controller.dart';
import 'resources/components/sockets/chats_controller.dart';
import 'resources/components/sockets/sockets.dart';
import 'utils/routes/routes_name.dart';

final navigationKey = GlobalKey<NavigatorState>();

void main() {
  Get.put(ImagePickerController());
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = "pk_test_51Oj6PmBwWHu7PT211T7fJvO6G3bykzsbbOibzsIJBvScYYC9o323Z2dGwk26eIgK6WWJS557aRmfrElhHbRx8zKn00BNIcbk4Q";
  hsController = Get.put(HomeScreenController());
  phController = Get.put(PHomeController());
  socketController = Get.put(SocketController());
  chatController = Get.put(GetChatController());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  socketController.connectSocket();

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
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.01),
          ),
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(elevation: 0, surfaceTintColor: Colors.transparent),
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
            initialRoute: RouteName.splashScreen,
          ),
        );
      },
    );
  }
}
