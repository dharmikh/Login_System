import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_system/Screen/HomeScreen/Home_Model/Home_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Firebasehelper {
  Firebasehelper._();

  static Firebasehelper firebase = Firebasehelper._();

  Future<bool> sighUpUser(String email, String password) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    bool isRegister = false;

    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      isRegister = true;
      print("Success");
    }).catchError((error) {
      print("======$error");
      isRegister = false;
    });
    return isRegister;
  }

  Future<bool> sighInUser(String email, String password) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    bool isSighIn = false;

    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      isSighIn = true;
    }).catchError((error) {
      isSighIn = false;
    });
    return isSighIn;
  }

  Future<bool> chekUser() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    if (await firebaseAuth.currentUser != null) {
      return true;
    }
    return false;
  }

  Future<void> sighOut() async {
    await FirebaseAuth.instance.signOut();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signOut();
  }

  Future<bool> GoogleLogIn() async {
    bool isLogin = false;
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      isLogin = true;
    }).catchError((error) {
      isLogin = false;
    });

    return isLogin;
  }

  Future<void> InsertBookData(HomeModel homeModel) async {
    print("=========${homeModel.name}");
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore.collection('Database').add({
      'name': homeModel.name,
      'image': homeModel.image,
      'author_name': homeModel.author_name,
      'author_about': homeModel.author_about,
      'book_about': homeModel.book_about,
      'rating': homeModel.rating,
      'publish_year': homeModel.publish_year,
      'id': homeModel.id,
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getBookData() {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    return firebaseFirestore.collection("Database").snapshots();
  }

  void DeleteCategory(String id) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore.collection("Database").doc("$id").delete();
  }

  void UpdetDataCetegory(String id, HomeModel homeModel) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore.collection("Database").doc("$id").update({
      'name': homeModel.name,
      'image': homeModel.image,
      'rating': homeModel.rating,
      'book_about': homeModel.book_about
    });
  }
}
