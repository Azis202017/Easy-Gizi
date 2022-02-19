import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatSearchController extends GetxController {
  final searchC = TextEditingController();
  var queryAwal = [].obs;
  var tempSearch = [].obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void searchChat(String data, String email) async {
    if (data.isEmpty) {
      queryAwal.value = [];
      tempSearch.value = [];
    } else {
      var capitalize = data.substring(0, 1).toUpperCase() + data.substring(1);
      if (queryAwal.isEmpty && data.length == 1) {
        CollectionReference users = firestore.collection("users");
        final keyNameResult = await users
            .where('keyName', isEqualTo: data.substring(0, 1).toUpperCase())
            .where(
              'email',
              isNotEqualTo: email,
            )
            .get();
        print(
          "Total data: ${keyNameResult.docs.length}",
        );
        if (keyNameResult.docs.isNotEmpty) {
          for (int i = 0; i < keyNameResult.docs.length; i++) {
            queryAwal.add(keyNameResult.docs[i].data() as Map<String, dynamic>);
          }
        } else {
          print("Tidak ada result");
        }
        if (queryAwal.isNotEmpty) {
          tempSearch.value = [];
          queryAwal.forEach((element) {
            print(element['name'].startsWith(capitalize));
            if (element['name'].startsWith(capitalize)) {
              tempSearch.add(element);
            }
          });
        }
      }
    }
    queryAwal.refresh();
    tempSearch.refresh();
  }
}
