// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/color_app.dart';
import '../../../theme/fonts_app.dart';
import '../../chat/controllers/chat_controller.dart';
import '../controllers/chat_search_controller.dart';

class ChatSearchView extends GetView<ChatSearchController> {
  @override
  final controller = Get.find<ChatSearchController>();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: Get.width,
              height: 220,
              child: Image.asset(
                'assets/images/background_top.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30,
                top: 75,
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    'assets/images/back_button.png',
                    width: 55,
                    height: 55,
                  ),
                ),
                title: Text(
                  'Chat Search',
                  style: interSemiBold.copyWith(
                    fontSize: 16,
                    color: whiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                trailing: SizedBox(
                  width: 50,
                ),
              ),
            ),
            Container(
              width: Get.width,
              margin: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 180,
              ),
              child: Column(
                children: [
                  TextField(
                    controller: controller.searchC,
                    onChanged: (value) => controller.searchChat(
                      value,
                      authController.user.value.email!,
                    ),
                    decoration: InputDecoration(
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 0,
                          color: whiteColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 0,
                          color: whiteColor,
                        ),
                      ),
                      prefixIcon: Icon(Icons.search, color: blackColor),
                      filled: true,
                      fillColor: whiteColor,
                      border: InputBorder.none,
                      hintText: 'Search Chat',
                      hintStyle: reguler.copyWith(
                        fontSize: 14,
                        color: blackColorOpacity,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Obx(
                    () => controller.tempSearch.isEmpty
                        ? Center(child: Text('Tidak ada data'))
                        : Container(
                            height: 500,
                            child: ListView.builder(
                              itemCount: controller.tempSearch.length,
                              itemBuilder: (context, index) { 
                                return Column(
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: Image.asset(
                                          'assets/images/doctor_photo.png'),
                                      title: Text(
                                          '${controller.tempSearch[index]['name']}'),
                                      subtitle:
                                          Text('There you go, if you need.. '),
                                      trailing: Container(
                                        width: 55,
                                        height: 55,
                                        margin: EdgeInsets.only(
                                          right: 30,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 16,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: primaryColor,
                                        ),
                                        child: GestureDetector(
                                          onTap: () =>
                                              authController.addNewConnection(
                                            '${controller.tempSearch[index]['email']}',
                                          ),
                                          child: Image.asset(
                                            'assets/images/Send.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(),
                                  ],
                                );
                              },
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
