import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/color_app.dart';
import '../../../theme/fonts_app.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  @override
  final controller = Get.find<ChatController>();
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chat ',
                          style: interSemiBold.copyWith(
                            fontSize: 24,
                            color: whiteColor,
                            letterSpacing: 0.03,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          '99+ unread messages',
                          style: reguler.copyWith(
                            fontSize: 14,
                            color: whiteColorOpacity,
                            letterSpacing: 0.03,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 30,
                    ),
                    child: Image.asset(
                      'assets/images/chat_icon.png',
                      width: 55,
                      height: 55,
                    ),
                  ),
                ],
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
                  GestureDetector(
                    child: TextField(
                      onSubmitted: (_) {
                        Get.toNamed(Routes.CHAT_SEARCH);
                      },
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
                  ),
                  Container(
                    height: 500,
                    child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream: controller
                            .chatsStream(authController.user.value.email!),
                        builder: (context, snapshot1) {
                          if (snapshot1.connectionState ==
                              ConnectionState.active) {
                            var listDocsChats = snapshot1.data!.docs;

                            return ListView.builder(
                              itemCount: listDocsChats.length,
                              itemBuilder: (context, index) {
                                return StreamBuilder<
                                        DocumentSnapshot<Map<String, dynamic>>>(
                                    stream: controller.friendStream(
                                        listDocsChats[index]["connection"]),
                                    builder: (context, snapshot2) {
                                      if (snapshot2.connectionState ==
                                          ConnectionState.active) {
                                        var data = snapshot2.data!.data();

                                        return Column(
                                          children: [
                                            ListTile(
                                              onTap: () {
                                                controller.goToChatRoom(
                                                  "${listDocsChats[index].id}",
                                                  authController
                                                      .user.value.email!,
                                                  listDocsChats[index]
                                                      ["connection"],
                                                );
                                              },
                                              contentPadding: EdgeInsets.zero,
                                              leading: Image.network(
                                                  '${data!["photoUrl"]}'),
                                              title: Text('${data['name']}'),
                                              subtitle: Text(
                                                  'There you go, if you need.. '),
                                              trailing: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  SizedBox(height: 5),
                                                  Text('01:00 pm'),
                                                  Container(
                                                    width: 21,
                                                    height: 21,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          primaryColor,
                                                      child: Text(
                                                        '${listDocsChats[index]["total_unread"]}',
                                                        style: interSemiBold
                                                            .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Divider(),
                                          ],
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    });
                              },
                            );
                          }
                          return Center(child: CircularProgressIndicator());
                        }),
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
