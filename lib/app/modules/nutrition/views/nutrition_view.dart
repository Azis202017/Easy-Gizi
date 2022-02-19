import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/color_app.dart';
import '../../../theme/fonts_app.dart';
import '../controllers/nutrition_controller.dart';

class NutritionView extends GetView<NutritionController> {
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
                    'Nutrition',
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
                        hintText: 'Search Nutrition',
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
                      height: 277,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 230,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/vegetables.png',
                                  width: 200,
                                  height: 150,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Vegetable salad with walnuts',
                                  style: interSemiBold.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '🔥 250.5 Calories',
                                  style: reguler,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 230,
                            margin: EdgeInsets.only(
                              right: 10,
                            ),
                            padding: EdgeInsets.only(
                              top: 15,
                              left: 15,
                              right: 15,
                            ),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/vegetables2.png',
                                  width: 200,
                                  height: 150,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Healthy pasta with mayo',
                                  style: interSemiBold.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '🔥 250.5 Calories',
                                  style: reguler,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height : 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New Recipe',
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
                    Container(
                      margin: EdgeInsets.only(
                        top: 30,
                      ),
                      height: 167,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 331,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/recipe.png',
                                  height: 137,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 31),
                                    Text(
                                      'Vegetable salad with Meat',
                                      style: interSemiBold.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '🔥 250.5 Calories',
                                      style: reguler.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Container(
                                      width: 150,
                                      height: 45,
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              width: 331,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/recipe2.png',
                                    height: 137,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 31),
                                      Text(
                                        'Vegetable salad with Meat',
                                        style: interSemiBold.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '🔥 250.5 Calories',
                                        style: reguler.copyWith(
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Container(
                                        width: 150,
                                        height: 45,
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
