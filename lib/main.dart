import 'package:easygizi/app/controllers/auth_controller.dart';
import 'package:easygizi/app/modules/chat/controllers/chat_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/modules/appointment/controllers/appointment_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final authController = Get.put(AuthController(), permanent: true);
  final appointmentController =
      Get.put(AppointmentController(), permanent: true);
  final chatController = Get.put(ChatController(), permanent: true);

  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        Duration(seconds: 5),
      ),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(
            () => GetMaterialApp(
              title: "Application",
              initialRoute: authController.isAuth.value
                  ? Routes.BOTTOM_NAVIGATION
                  : Routes.LOGIN_PAGE,
              getPages: AppPages.routes,
            ),
          );
        }

        return SplashScreen();
      },
    );
  }
}
