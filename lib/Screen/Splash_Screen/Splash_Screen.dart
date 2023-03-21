import 'dart:async';
import 'package:login_system/Screen/HomeScreen/Controller/Home_Countroller.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  HomeCountoller homeCountoller = Get.put(HomeCountoller());

  @override
  void initState() {
    homeCountoller.holdSreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.purpleAccent,
            Colors.deepPurple,
          ]),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Column(
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.w,
                        // color: Colors.red,
                        child: Lottie.asset("assets/loti/login2.json"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: Lottie.asset("assets/loti/welcome.json"),
                      ),
                      Container(
                        child: CircularProgressIndicator(color: Colors.blue),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        height: 6.h,
                        width: 70.w,
                        child: Center(
                          child: Text(
                            "Login",
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 20),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        height: 6.h,
                        width: 70.w,
                        child: Center(
                          child: Text(
                            "Sigh Up",
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 20),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.white),
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
