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
        user(UserModel.fromJson(currentUserData));
        final listChats =
            await users.doc(_currentUser!.email).collection("chats").get();

        if (listChats.docs.length != 0) {
          List<ChatUsers> dataListChats = List<ChatUsers>.empty();
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

  void addNewConnection(
    String email,
  ) async {
    bool flagNewConnection = false;
    String date = DateTime.now().toIso8601String();
    CollectionReference chats = firestore.collection('chats');
    CollectionReference users = firestore.collection('users');
    final docUser = await users.doc(_currentUser!.email).get();
    final docChats = (docUser.data() as Map<String, dynamic>)['chats'] as List;
    var chat_id;
    if (docChats.isNotEmpty) {
      docChats.forEach((singleChat) {
        if (singleChat['connection'] == email) {
          chat_id = singleChat['chat_id'];
        }
      });
      if (chat_id == null) {
        flagNewConnection = false;
      } else {
        flagNewConnection = false;
      }
    } else {
      flagNewConnection = true;
    }
    if (flagNewConnection) {
      final chatDoc = await chats.where(
        'connections',
        whereIn: [
          [
            _currentUser!.email,
            email,
          ],
          [
            email,
            _currentUser!.email,
          ],
        ],
      ).get();
      if (chatDoc.docs.isNotEmpty) {
        // Terdapat data chats (sudah ada diantara mereka berdua)
        final chatsDataId = chatDoc.docs[0].id;

        final chatsData = chatDoc.docs[0].data() as Map<String, dynamic>;
        docChats.add({
          "connection": email,
          "chat_id": chatsDataId,
          "lastTime": chatsData["lastTime"],
          "total_unread": 0,
        });

        await users.doc(_currentUser!.email).update({"chats": docChats});
        user.update((user) {
          user!.chats = List<ChatUsers>.from(docChats);
        });
        chat_id = chatsDataId;
        user.refresh();
      } else {
        final newChatDocument = await chats.add({
          "connections": [
            _currentUser!.email,
            email,
          ],
          "chat": [],
        });

        docChats.add({
          "connection": email,
          "chat_id": newChatDocument.id,
          "lastTime": date,
          "total_unread": 0,
        });

        await users.doc(_currentUser!.email).update({"chats": docChats});
        user.update((user) {
          user!.chats = List<ChatUsers>.from(docChats);
        });
        user.refresh();
        chat_id = newChatDocument.id;
      }
    }
    print(chat_id);
    Get.toNamed(Routes.CHAT_ROOM, arguments: chat_id);
  }
}
