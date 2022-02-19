import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/color_app.dart';
import '../../../theme/fonts_app.dart';
import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 200),
        child: Stack(
          children: [
            Image.asset('assets/images/background_top.png', fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.only(
                left: 30,
                top: 75,
                right: 30,
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
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Dr. Anastasya Salma',
                      style: interSemiBold.copyWith(
                        fontSize: 16,
                        color: whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/online_dot.png',
                          width: 6,
                          height: 6,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Online',
                          style: reguler.copyWith(
                            fontSize: 12,
                            color: whiteColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: GestureDetector(
                  onTap: () {
                    Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
                  },
                  child: Image.asset(
                    'assets/images/video_icon.png',
                    width: 55,
                    height: 55,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 75,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 34,
                    ),
                    width: Get.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: greyColorOpacity,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Consultation Start',
                          style: interSemiBold.copyWith(
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'You can consult your problem to the nutritionist',
                          textAlign: TextAlign.center,
                          style: reguler.copyWith(
                            color: greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ChatBubble(
                    isSender: true,
                  ),
                  ChatBubble(
                    isSender: false,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 75,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10, left: 30),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: greyColor3,
                        hintText: 'Type message ...',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0,
                            bottom: 15,
                            left: 20,
                            right: 20,
                          ),
                          child: Image.asset(
                            'assets/images/attach-file.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
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
                      ),
                    ),
                  ),
                ),
                Container(
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
                    borderRadius: BorderRadius.circular(15),
                    color: primaryColor,
                  ),
                  child: Image.asset(
                    'assets/images/Send.png',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isSender;
  const ChatBubble({
    Key? key,
    required this.isSender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 30,
        top: 30,
        left: 30,
      ),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          isSender
              ? Container(
                  width: 190,
                  margin: EdgeInsets.only(
                    bottom: 10,
                    left: isSender ? 0 : 15,
                  ),
                  decoration: BoxDecoration(
                    color: isSender ? primaryColor : greyColorOpacity2,
                    borderRadius: isSender
                        ? BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(15),
                          )
                        : BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                  ),
                  padding: EdgeInsets.only(
                    right: 20,
                    left: 20,
                    top: 16,
                    bottom: 17,
                  ),
                  child: Text(
                    "Okay Doctor!, thanks.",
                    style: reguler.copyWith(
                        fontSize: 14,
                        color: isSender ? whiteColor : blackColor2),
                  ),
                )
              : Row(
                  children: [
                    isSender
                        ? SizedBox()
                        : Image.asset(
                            'assets/images/doctor_photo.png',
                            width: 55,
                            height: 55,
                          ),
                    Container(
                      width: 190,
                      margin: EdgeInsets.only(
                        bottom: 10,
                        left: isSender ? 0 : 15,
                      ),
                      decoration: BoxDecoration(
                        color: isSender ? primaryColor : greyColorOpacity2,
                        borderRadius: isSender
                            ? BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(5),
                                bottomLeft: Radius.circular(15),
                              )
                            : BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                      ),
                      padding: EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 16,
                        bottom: 17,
                      ),
                      child: Text(
                        "Okay Doctor!, thanks.",
                        style: reguler.copyWith(
                            fontSize: 14,
                            color: isSender ? whiteColor : blackColor2),
                      ),
                    ),
                  ],
                ),
          Padding(
            padding:
                isSender ? EdgeInsets.zero : const EdgeInsets.only(left: 70.0),
            child: Text(
              "18:22 PM",
              style: reguler.copyWith(
                fontSize: 14,
                color: greyColor,
              ),
            ),
          ),
        ],
      ),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    );
  }
}
