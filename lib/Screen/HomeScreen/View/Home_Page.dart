import 'package:flutter/material.dart';
import 'package:login_system/Screen/HomeScreen/Controller/Home_Countroller.dart';
import 'package:login_system/Screen/HomeScreen/Home_Model/Home_Model.dart';
import 'package:login_system/utils/firebase_helper/FR_helper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeCountoller homeCountoller = Get.put(HomeCountoller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple.shade50,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade300,
          centerTitle: true,
          title: Text("Browser"),
          actions: [
            InkWell(
              onTap: () async {
                await Firebasehelper.firebase.sighOut();
                Get.offNamed('login');
              },
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.logout,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: Firebasehelper.firebase.getBookData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List<HomeModel> l1 = [];

              var docs = snapshot.data!.docs;

              for (var doc in docs) {
                Map data = doc.data() as Map;
                HomeModel p1 = HomeModel(
                    name: data['name'],
                    image: data['image'],
                    publish_year: data['publish_year'],
                    author_name: data['author_name'],
                    author_about: data['author_name'],
                    rating: data['rating'],
                    book_about: data['book_about'],
                    id: doc.id);
                l1.add(p1);
              }
              print("========++======${l1}");
              return ListView.builder(
                itemBuilder: (context, index) {
                  return FocusedMenuHolder(
                    menuWidth: 15.h,
                    onPressed: () {},
                    menuItems: [
                      FocusedMenuItem(
                        title: Text("Delete"),
                        onPressed: () {
                          Firebasehelper.firebase.DeleteCategory(l1[index].id!);
                          Get.snackbar("Hello", "Your Book is Delete");
                        },
                        trailingIcon: Icon(Icons.delete),
                      ),
                      FocusedMenuItem(
                        title: Text("Update"),
                        onPressed: () {
                          Get.defaultDialog(
                            radius: Checkbox.width,
                            content: Form(
                              key: homeCountoller.subkey.value,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      controller:
                                          homeCountoller.txtupdetname.value,
                                      decoration: InputDecoration(
                                        hintText: "Enter Book Name",
                                      ),
                                      validator: (value) {
                                        print("$value");
                                        if (value!.isEmpty) {
                                          return "Please Enater Book Name";
                                        }
                                      },
                                    ),
                                    TextFormField(
                                      controller:
                                          homeCountoller.txtupdetreting.value,
                                      decoration: InputDecoration(
                                        hintText: "Enter Book Reting",
                                      ),
                                      validator: (value) {
                                        print("$value");
                                        if (value!.isEmpty) {
                                          return "Please Enater Reting";
                                        } else if (double.parse(value) > 5.0) {
                                          return "Please Add Maximum 5.0 Rating";
                                        }
                                      },
                                    ),
                                    TextFormField(
                                      controller:
                                          homeCountoller.txtupdetimage.value,
                                      decoration: InputDecoration(
                                        hintText: "Enter Book Image",
                                      ),
                                      validator: (value) {
                                        print("$value");
                                        if (value!.isEmpty) {
                                          return "Please Enater Book Image";
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    TextFormField(
                                      controller: homeCountoller
                                          .txtupdetBook_about.value,
                                      decoration: InputDecoration(
                                        hintText: "Enter Book About",
                                      ),
                                      validator: (value) {
                                        print("$value");
                                        if (value!.isEmpty) {
                                          return "Please Enater Book About";
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        print(
                                            "========= ${homeCountoller.txtupdetreting.value.text}");
                                        if (homeCountoller
                                            .subkey.value.currentState!
                                            .validate()) {
                                          Firebasehelper.firebase
                                              .UpdetDataCetegory(
                                            l1[index].id!,
                                            HomeModel(
                                              name: homeCountoller
                                                  .txtupdetname.value.text,
                                              rating: homeCountoller
                                                  .txtupdetreting.value.text,
                                              image: homeCountoller
                                                  .txtupdetimage.value.text,
                                              book_about: homeCountoller
                                                  .txtupdetBook_about
                                                  .value
                                                  .text,
                                            ),
                                          );

                                          Get.back();
                                          Get.snackbar(
                                              "Hello", "Book Data is update");
                                        }
                                      },
                                      child: Container(
                                        height: 6.h,
                                        width: 30.w,
                                        // margin: EdgeInsets.only(bottom: 20),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Update",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.deepPurpleAccent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        trailingIcon: Icon(Icons.edit),
                      ),
                    ],
                    child: InkWell(
                      onTap: () {
                        homeCountoller.m1 = l1[index];
                        Get.toNamed('book');
                      },
                      child: Container(
                        height: 45.h,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5.h, left: 80),
                              child: Container(
                                height: 35.h,
                                width: 70.w,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        "${l1[index].name}",
                                        style: GoogleFonts.merriweather(
                                            color: Colors.black, fontSize: 25),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.h, bottom: 2.h),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              "${double.parse(l1[index].rating!) <= 1.0 ? "⭐" : double.parse(l1[index].rating!) <= 2.0 ? "⭐ ⭐" : double.parse(l1[index].rating!) <= 3.0 ? "⭐ ⭐ ⭐" : double.parse(l1[index].rating!) <= 4.0 ? "⭐ ⭐ ⭐ ⭐" : double.parse(l1[index].rating!) <= 5.0 ? "⭐ ⭐ ⭐ ⭐ ⭐" : ""}",
                                              style: TextStyle(
                                                  color: Colors.yellow,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Text(
                                            "${l1[index].rating}",
                                            style: GoogleFonts.merriweather(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.h, right: 2.w),
                                      child: Text(
                                        "${l1[index].book_about}",
                                        maxLines: 8,
                                        style: GoogleFonts.merriweather(
                                            color: Colors.black, fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 20,
                                          offset: Offset(5, 10)
                                          // blurStyle: BlurStyle.inner,
                                          )
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.h, left: 7.w),
                              child: Container(
                                height: 25.h,
                                width: 30.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    "${l1[index].image}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 10,
                                        offset: Offset(6, 2)
                                        // blurStyle: BlurStyle.inner,
                                        )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: l1.length,
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('add');
          },
          child: Container(
            height: 10.h,
            width: 20.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepPurple.shade300,
              boxShadow: [
                BoxShadow(color: Colors.deepPurple.shade300, blurRadius: 30)
              ],
            ),
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
