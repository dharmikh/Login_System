import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_system/Screen/HomeScreen/Controller/Home_Countroller.dart';
import 'package:login_system/Screen/HomeScreen/Home_Model/Home_Model.dart';
import 'package:login_system/utils/firebase_helper/FR_helper.dart';
import 'package:sizer/sizer.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({Key? key}) : super(key: key);

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  HomeCountoller homeController = Get.put(HomeCountoller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: homeController.subkey.value,
        child: Scaffold(
          backgroundColor: Colors.deepPurple.shade50,
          appBar: AppBar(
            title: Text(
              "Add Book",
              style: TextStyle(color: Colors.white, fontSize: 26.sp),
            ),
            backgroundColor: Colors.deepPurple.shade300,
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.only(
              left: Get.width / 21,
              top: Get.width / 15,
              right: Get.width / 21,
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  TextFormField(
                    controller: homeController.txtBookName.value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.menu_book,
                        size: 21.sp,
                        color: Colors.deepPurple,
                      ),
                      prefixIconColor: Colors.grey,
                      hintText: "Book Name",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Add Book Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: Get.width / 18,
                  ),
                  Container(
                    height: Get.height / 12,
                    width: Get.width,
                    // color: Colors.red,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: homeController.txtBookImgLink.value,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.image_rounded,
                                size: 21.sp,
                                color: Colors.deepPurple,
                              ),
                              prefixIconColor: Colors.grey,
                              hintText: "Image Link",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 15.sp),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Add Image Link";
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          height: Get.width / 8,
                          width: Get.width / 8,
                          // color: Colors.red,
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.visibility_outlined,
                            size: 25.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.width / 18,
                  ),
                  TextFormField(
                    controller: homeController.txtAuthorName.value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        size: 21.sp,
                        color: Colors.deepPurple,
                      ),
                      prefixIconColor: Colors.grey,
                      hintText: "Author Name",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Add Author Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: Get.width / 18,
                  ),
                  TextFormField(
                    controller: homeController.txtAboutAuthor.value,
                    maxLines: 4,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.edit,
                        size: 21.sp,
                        color: Colors.deepPurple,
                      ),
                      prefixIconColor: Colors.grey,
                      hintText: "About Author",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Add About Author";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: Get.width / 18,
                  ),
                  TextFormField(
                    controller: homeController.txtAboutBook.value,
                    maxLines: 4,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.menu_book,
                        color: Colors.deepPurple,
                        size: 21.sp,
                      ),
                      prefixIconColor: Colors.grey,
                      hintText: "About Book",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Add About Book";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: Get.width / 18,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: homeController.txtBookRating.value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.star,
                        size: 21.sp,
                        color: Colors.deepPurple,
                      ),
                      prefixIconColor: Colors.grey,
                      hintText: "Rating",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Add Rating";
                      } else if (double.parse(value) > 5.0) {
                        return "Please Add Maximum 5.0 Rating";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: Get.width / 18,
                  ),
                  TextFormField(
                    controller: homeController.txtBookPublishYear.value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.calendar_month,
                        size: 21.sp,
                        color: Colors.deepPurple,
                      ),
                      prefixIconColor: Colors.grey,
                      hintText: "Publish Year",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Add Publish Year";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: Get.width / 18,
                  ),
                  InkWell(
                    onTap: () {
                      if (homeController.subkey.value.currentState!
                          .validate()) {
                        HomeModel homemodel = HomeModel(
                          name: homeController.txtBookName.value.text,
                          image: homeController.txtBookImgLink.value.text,
                          author_name: homeController.txtAuthorName.value.text,
                          author_about:
                              homeController.txtAboutAuthor.value.text,
                          book_about: homeController.txtAboutBook.value.text,
                          rating: homeController.txtBookRating.value.text,
                          publish_year:
                              homeController.txtBookPublishYear.value.text,
                        );
                        Get.back();
                        Firebasehelper.firebase.InsertBookData(homemodel);
                      } else {
                        Get.snackbar("Alert", "Please Add Your Data");
                      }
                    },
                    child: Container(
                      height: Get.height / 15,
                      width: Get.width / 1.3,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple.shade300,
                          borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: Text(
                        "Add Book",
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.width / 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
