import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/color_app.dart';
import '../../../theme/fonts_app.dart';
import '../controllers/event_controller.dart';

class EventView extends GetView<EventController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    'Event',
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
                        hintText: 'Search Event',
                        hintStyle: reguler.copyWith(
                          fontSize: 14,
                          color: blackColorOpacity,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 30,
                      ),
                      height: 334,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              right: 10,
                            ),
                            padding: EdgeInsets.only(
                              top: 15,
                              left: 15,
                              right: 8,
                            ),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/webinar.png',
                                  width: 251,
                                  height: 244,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/user3.png',
                                          width: 32,
                                          height: 32,
                                        ),
                                        Image.asset(
                                          'assets/images/user_1.png',
                                          width: 32,
                                          height: 32,
                                        ),
                                        Image.asset(
                                          'assets/images/user_2.png',
                                          width: 32,
                                          height: 32,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 45,
                                      margin: EdgeInsets.only(left: 24),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Join Now',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 45,
                        bottom: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Event For You',
                            style: interSemiBold.copyWith(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'See All',
                            style: interSemiBold.copyWith(
                              fontSize: 14,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 210,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 210,
                            margin: EdgeInsets.only(
                              right: 10,
                            ),
                            padding: EdgeInsets.only(
                              top: 15,
                            ),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/event1.png',
                                  width: 180,
                                  height: 100,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 15,
                                    left: 15,
                                  ),
                                  child: Text(
                                    'Contest to make posters about nutrition',
                                    style: interSemiBold.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 210,
                            margin: EdgeInsets.only(
                              right: 10,
                            ),
                            padding: EdgeInsets.only(
                              top: 15,
                            ),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/event2.png',
                                  width: 180,
                                  height: 100,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 15,
                                    left: 15,
                                  ),
                                  child: Text(
                                    'Webinar about the importance of vegetables',
                                    style: interSemiBold.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
