// ignore_for_file: prefer_typing_uninitialized_variables, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easygizi/app/data/models/user_model.dart';
import 'package:easygizi/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var isAuth = false.obs;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  UserCredential? userCredential;
  var user = UserModel().obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> login() async {
    try {
      await _googleSignIn.signOut();
      await _googleSignIn.signIn().then(
            (value) => _currentUser = value,
          );
      final isSign = await _googleSignIn.isSignedIn();
      if (isSign) {
        print("Sudah Berhasil Login");
        final googleAuth = await _currentUser!.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential).then(
              (value) => userCredential = value,
            );
        CollectionReference users = firestore.collection('users');
        final checkUser = await users.doc(_currentUser!.email).get();

        if (checkUser.data() == null) {
          await users.doc(_currentUser!.email).set({
            "uid": userCredential!.user!.uid,
            "name": _currentUser!.displayName,
            "email": _currentUser!.email,
            "photoUrl": _currentUser!.photoUrl,
            "status": "",
            "gender": "Male",
            "age": 19,
            "weight": 55,
            "height": 155,
            "role": "user",
            'about': 'test',
            'rating': 0,
            'patients': 0,
            'experience': 0,
            'reviews': 0,
            'keyName': _currentUser!.displayName!.substring(0, 1).toUpperCase(),
            "creationTime":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            "updatedTime": DateTime.now().toIso8601String(),
            "chats": [],
          });
        } else {
          await users.doc(_currentUser!.email).update({
            'lastSignInTime': userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          });
        }
        final currentUser = await users.doc(_currentUser!.email).get();
        final currentUserData = currentUser.data() as Map<String, dynamic>;
        user(
          UserModel(
            name: currentUserData['name'],
            email: currentUserData['email'],
            photoUrl: currentUserData['photoUrl'],
            status: currentUserData['status'],
            creationTime: currentUserData['creationTime'],
            lastSignInTime: currentUserData['lastSignInTime'],
            updatedTime: currentUserData['updatedTime'],
            patients: currentUserData['patients'],
            about: currentUserData['about'],
            age: currentUserData['age'],
            experience: currentUserData['experience'],
            gender: currentUserData['gender'],
            height: currentUserData['height'],
            rating: currentUserData['rating'],
            role: currentUserData['role'],
            uid: currentUserData['uid'],
            weight: currentUserData['weight'],
          ),
        );
        final listChats =
            await users.doc(_currentUser!.email).collection("chats").get();

        if (listChats.docs.isNotEmpty) {
          List<ChatUsers> dataListChats = [];
          listChats.docs.forEach((element) {
            var dataDocChat = element.data();
            var dataDocChatId = element.id;
            dataListChats.add(ChatUsers(
              chatId: dataDocChatId,
              connection: dataDocChat["connection"],
              lastTime: dataDocChat["lastTime"],
              totalUnread: dataDocChat["total_unread"],
            ));
          });

          user.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          user.update((user) {
            user!.chats = [];
          });
        }

        user.refresh();
        isAuth.value = true;
        Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
      } else {
        print("Gagal Login");
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    _googleSignIn.signOut();
    Get.offAllNamed(Routes.LOGIN_PAGE);
  }

  void addNewConnection(String friendEmail) async {
    bool flagNewConnection = false;
    var chatId;
    String date = DateTime.now().toIso8601String();
    CollectionReference chats = firestore.collection("chats");
    CollectionReference users = firestore.collection("users");

    final docChats =
        await users.doc(_currentUser!.email).collection("chats").get();

    if (docChats.docs.isNotEmpty) {
      // user sudah pernah chat dengan siapapun
      final checkConnection = await users
          .doc(_currentUser!.email)
          .collection("chats")
          .where("connection", isEqualTo: friendEmail)
          .get();

      if (checkConnection.docs.isNotEmpty) {
        // sudah pernah buat koneksi dengan => friendEmail
        flagNewConnection = false;

        //chatId from chats collection
        chatId = checkConnection.docs[0].id;
      } else {
        // blm pernah buat koneksi dengan => friendEmail
        // buat koneksi ....
        flagNewConnection = true;
      }
    } else {
      // blm pernah chat dengan siapapun
      // buat koneksi ....
      flagNewConnection = true;
    }

    if (flagNewConnection) {
      // cek dari chats collection => connections => mereka berdua...
      final chatsDocs = await chats.where(
        "connections",
        whereIn: [
          [
            _currentUser!.email,
            friendEmail,
          ],
          [
            friendEmail,
            _currentUser!.email,
          ],
        ],
      ).get();

      if (chatsDocs.docs.isNotEmpty) {
        // terdapat data chats (sudah ada koneksi antara mereka berdua)
        final chatDataId = chatsDocs.docs[0].id;
        final chatsData = chatsDocs.docs[0].data() as Map<String, dynamic>;

        await users
            .doc(_currentUser!.email)
            .collection("chats")
            .doc(chatDataId)
            .set({
          "connection": friendEmail,
          "lastTime": chatsData["lastTime"],
          "total_unread": 0,
        });

        final listChats =
            await users.doc(_currentUser!.email).collection("chats").get();

        if (listChats.docs.isNotEmpty) {
          List<ChatUsers> dataListChats = [];
          listChats.docs.forEach((element) {
            var dataDocChat = element.data();
            var dataDocChatId = element.id;
            dataListChats.add(ChatUsers(
              chatId: dataDocChatId,
              connection: dataDocChat["connection"],
              lastTime: dataDocChat["lastTime"],
              totalUnread: dataDocChat["total_unread"],
            ));
          });
          user.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          user.update((user) {
            user!.chats = [];
          });
        }

        chatId = chatDataId;

        user.refresh();
      } else {
        // buat baru , mereka berdua benar2 belum ada koneksi
        final newChatDoc = await chats.add({
          "connections": [
            _currentUser!.email,
            friendEmail,
          ],
        });
        chats.doc(newChatDoc.id).collection("chat");

        await users
            .doc(_currentUser!.email)
            .collection("chats")
            .doc(newChatDoc.id)
            .set({
          "connection": friendEmail,
          "lastTime": date,
          "total_unread": 0,
        });

        final listChats =
            await users.doc(_currentUser!.email).collection("chats").get();

        if (listChats.docs.isNotEmpty) {
          List<ChatUsers> dataListChats = [];
          listChats.docs.forEach((element) {
            var dataDocChat = element.data();
            var dataDocChatId = element.id;
            dataListChats.add(ChatUsers(
              chatId: dataDocChatId,
              connection: dataDocChat["connection"],
              lastTime: dataDocChat["lastTime"],
              totalUnread: dataDocChat["total_unread"],
            ));
          });
          user.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          user.update((user) {
            user!.chats = [];
          });
        }

        chatId = newChatDoc.id;
        final updateStatusChat = await chats
            .doc(chatId)
            .collection("chat")
            .where("isRead", isEqualTo: false)
            .where("penerima", isEqualTo: _currentUser!.email)
            .get();

        updateStatusChat.docs.forEach((element) async {
          await chats
              .doc(chatId)
              .collection("chat")
              .doc(element.id)
              .update({"isRead": true});
        });

        await users
            .doc(_currentUser!.email)
            .collection("chats")
            .doc(chatId)
            .update({"total_unread": 0});
        user.refresh();
      }
    }

    print(chatId);

    Get.toNamed(Routes.CHAT_ROOM, arguments: chatId);
  }
}
