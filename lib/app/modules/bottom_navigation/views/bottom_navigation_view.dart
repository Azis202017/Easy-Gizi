import 'package:easygizi/app/modules/chat_room/views/chat_room_view.dart';
import 'package:easygizi/app/modules/home/views/home_view.dart';
import 'package:easygizi/app/modules/profile_user/views/profile_user_view.dart';
import 'package:easygizi/app/theme/color_app.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart';
import '../../appointment/views/appointment_view.dart';
import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomeView(),
              AppointmentView(),
              ChatRoomView(),
              ProfileUserView(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: whiteColor,
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            selectedItemColor: primaryColor,
            unselectedItemColor: greyColor,
            type: BottomNavigationBarType.fixed,
            iconSize: 24,
            items: [
              BottomNavigationBarItem(
                icon: controller.tabIndex == 0
                    ? Icon(IconlyBold.home)
                    : Icon(IconlyLight.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: controller.tabIndex == 1
                    ? Icon(IconlyBold.calendar)
                    : Icon(IconlyLight.calendar),
                label: 'Appointment',
              ),
              BottomNavigationBarItem(
                icon: controller.tabIndex == 2
                    ? Icon(IconlyBold.chat)
                    : Icon(IconlyLight.chat),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: controller.tabIndex == 3
                    ? Icon(IconlyBold.profile)
                    : Icon(IconlyLight.profile),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }

}
