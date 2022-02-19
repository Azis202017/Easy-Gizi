import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easygizi/app/data/models/users_model_model.dart';
import 'package:easygizi/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var isAuth = false.obs;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  UserCredential? userCredential;
  UsersModel user = UsersModel();
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
          users.doc(_currentUser!.email).set({
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
            "creationTime":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            "updatedTime": DateTime.now().toIso8601String(),
          });
        } else {
          users.doc(_currentUser!.email).update({
            'lastSignInTime': userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          });
        }
        final currentUser = await users.doc(_currentUser!.email).get();
        final currentUserData = currentUser.data() as Map<String, dynamic>;
        user = UsersModel(
          name: currentUserData['name'],
          email : currentUserData['email'],
          photoUrl: currentUserData['photoUrl'],
          status: currentUserData['status'],
          creationTime : currentUserData['creationTime'],
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

        );
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
}
