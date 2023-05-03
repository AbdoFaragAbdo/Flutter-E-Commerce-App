import 'package:e_commerce_app/core/service/firestore_user.dart';
import 'package:e_commerce_app/helper/local_storage_data.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/view/control_view.dart';
import 'package:e_commerce_app/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? email, password, name;
  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;
  final LocalStorageData localStorageData = Get.find();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentUser(_auth.currentUser!.uid);
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void GoogleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleUser?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication!.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(ControllView());
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        await FireStoreUser().getCurrentUser(value.user!.uid).then((value) {
          setUser(UserModel.fromjson(value.data() as Map<String, dynamic>));
        });
      });
      Get.offAll(ControllView());
    } catch (e) {
      print('error');
      Get.snackbar('error login account', 'eror',
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        await FireStoreUser().addUserToFirestore(UserModel(
            userId: user.user!.uid,
            email: user.user!.email,
            name: name == null ? user.user!.displayName : name,
            pic: ''));
      });

      Get.offAll(ControllView());
    } catch (e) {
      print('error');
      Get.snackbar('error login account', 'eror',
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      name: name == null ? user.user!.displayName : name,
      pic: '',
    );
    await FireStoreUser().addUserToFirestore(userModel);
    setUser(userModel);
  }

  void getCurrentUser(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromjson(value.data() as Map<String, dynamic>));
    });
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
