import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_system/Screen/HomeScreen/Home_Model/Home_Model.dart';
import 'package:login_system/utils/firebase_helper/FR_helper.dart';

class HomeCountoller extends GetxController {

  HomeModel m1 = HomeModel();

  Rx<TextEditingController> txtnamelogin = TextEditingController().obs;
  Rx<TextEditingController> txtpasslogin = TextEditingController().obs;
  Rx<TextEditingController> txtnameSign = TextEditingController().obs;
  Rx<TextEditingController> txtpassSign = TextEditingController().obs;
  Rx<TextEditingController> txtname = TextEditingController().obs;
  Rx<TextEditingController> txtBookName = TextEditingController().obs;
  Rx<TextEditingController> txtBookImgLink = TextEditingController().obs;
  Rx<TextEditingController> txtAuthorName = TextEditingController().obs;
  Rx<TextEditingController> txtAboutAuthor = TextEditingController().obs;
  Rx<TextEditingController> txtAboutBook = TextEditingController().obs;
  Rx<TextEditingController> txtBookRating = TextEditingController().obs;
  Rx<TextEditingController> txtBookPublishYear = TextEditingController().obs;
  Rx<TextEditingController> txtupdetname = TextEditingController().obs;
  Rx<TextEditingController> txtupdetreting = TextEditingController().obs;
  Rx<TextEditingController> txtupdetimage = TextEditingController().obs;
  Rx<TextEditingController> txtupdetBook_about = TextEditingController().obs;
  RxBool visibal = true.obs;
  Rx<GlobalKey<FormState>> subkey = GlobalKey<FormState>().obs;

  Future<void> holdSreen() async {
    bool isLogin = await Firebasehelper.firebase.chekUser();
    print("========== $isLogin");
    if (isLogin) {
      Timer(Duration(seconds: 6), () => Get.offNamed('page'));
    } else {
      Timer(Duration(seconds: 6), () => Get.offNamed('login'));
    }
  }
}
