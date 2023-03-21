import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_system/Screen/HomeScreen/View/Add_Page.dart';
import 'package:login_system/Screen/HomeScreen/View/Home_Page.dart';
import 'package:login_system/Screen/Second_Screen/SighUp_Screen.dart';
import 'package:login_system/Screen/Showbook_page/view/Book_page.dart';
import 'package:login_system/Screen/Splash_Screen/Splash_Screen.dart';
import 'package:sizer/sizer.dart';
import 'Screen/Second_Screen/Login_Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // initialRoute: 'book',
          routes: {
            '/': (p0) => Splash_Screen(),
            'login': (p0) => loginPage(),
            'home': (p0) => Sighup_Screen(),
            'page': (p0) => HomePage(),
            'add': (p0) => AddBookPage(),
            'book': (p0) => Book_page(),
          },
        );
      },
    ),
  );
}
