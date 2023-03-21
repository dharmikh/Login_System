import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_system/Screen/HomeScreen/Controller/Home_Countroller.dart';
import 'package:login_system/utils/firebase_helper/FR_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  HomeCountoller homeCountoller = Get.put(HomeCountoller());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: homeCountoller.subkey.value,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.purpleAccent,
                Colors.deepPurple,
              ])),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Column(
                    children: [
                      Text(
                        "WELCOME",
                        style: GoogleFonts.oswald(
                            color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        "Login your Account",
                        style: GoogleFonts.amaticSc(
                            color: Colors.white, fontSize: 35),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " Please Enter Your Email";
                              }
                            },
                            controller: homeCountoller.txtnamelogin.value,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: Colors.grey.shade200,
                                size: 20,
                              ),
                              suffixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                                size: 20,
                              ),
                              prefixIconConstraints: BoxConstraints(
                                maxHeight: 20,
                                maxWidth: 25,
                              ),
                              border: InputBorder.none,
                              hintText: "Enter your Email",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20)),
                          child: Obx(
                            () => TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return " Please Enter Your password";
                                }
                              },
                              obscureText: homeCountoller.visibal.value,
                              controller: homeCountoller.txtpasslogin.value,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: Colors.grey.shade200,
                                  size: 20,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    homeCountoller.visibal.value =
                                        !homeCountoller.visibal.value;
                                  },
                                  child: Obx(
                                    () => Icon(
                                      homeCountoller.visibal.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                prefixIconConstraints: BoxConstraints(
                                  maxHeight: 20,
                                  maxWidth: 25,
                                ),
                                border: InputBorder.none,
                                hintText: "Enter your Password",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Card(
                        child: InkWell(
                          onTap: () async {
                            if (homeCountoller.subkey.value.currentState!
                                .validate()) {
                              bool isSighIn = await Firebasehelper.firebase
                                  .sighInUser(
                                      homeCountoller.txtnamelogin.value.text,
                                      homeCountoller.txtpasslogin.value.text);
                              if (isSighIn) {
                                Get.snackbar("Success",
                                    "${homeCountoller.txtnameSign.value.text}");
                                Get.offNamed('page');
                              } else {
                                Get.snackbar("title", "Please Tray again");
                              }
                            }
                          },
                          child: Container(
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
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: 35.w,
                            color: Colors.white,
                          ),
                          Container(
                            child: Text(
                              " or login with ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 35.w,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 3.w),
                              child: InkWell(onTap: () async {
                                bool isLogin = await  Firebasehelper.firebase.GoogleLogIn();
                                if(isLogin)
                                {
                                  Get.offNamed('page');
                                }else
                                {
                                  Get.snackbar("Sorry", "ERROR");
                                }
                              },
                                child: Container(
                                  height: 6.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "assets/image/google-symbol.png",
                                    height: 8.h,
                                    width: 8.w,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.w),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Container(
                                height: 6.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/image/facebook.png",
                                  height: 9.h,
                                  width: 9.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Don`t have Account?",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed('home');
                            },
                            child: Container(
                              child: Text(
                                " Sigh UP Now",
                                style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
