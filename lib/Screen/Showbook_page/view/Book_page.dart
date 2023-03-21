import 'package:flutter/material.dart';
import 'package:login_system/Screen/HomeScreen/Controller/Home_Countroller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Book_page extends StatefulWidget {
  const Book_page({Key? key}) : super(key: key);

  @override
  State<Book_page> createState() => _Book_pageState();
}

class _Book_pageState extends State<Book_page> {
  HomeCountoller homeCountoller = Get.put(HomeCountoller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${homeCountoller.m1.name}"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple.shade300,
        ),
        backgroundColor: Colors.deepPurple.shade50,
        body: Stack(
          children: [
            Container(
              height: 60.h,
              width: 80.w,
              margin: EdgeInsets.only(left: 10.w, top: 25.h, bottom: 4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, blurRadius: 40, offset: Offset(2, 2))
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        "${homeCountoller.m1.name}",
                        style: GoogleFonts.merriweather(
                            color: Colors.black, fontSize: 15),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "${double.parse(homeCountoller.m1.rating!) <= 1.0 ? "⭐" : double.parse(homeCountoller.m1.rating!) <= 2.0 ? "⭐ ⭐" : double.parse(homeCountoller.m1.rating!) <= 3.0 ? "⭐ ⭐ ⭐" : double.parse(homeCountoller.m1.rating!) <= 4.0 ? "⭐ ⭐ ⭐ ⭐" : double.parse(homeCountoller.m1.rating!) <= 5.0 ? "⭐ ⭐ ⭐ ⭐ ⭐" : ""} ${homeCountoller.m1.rating}",
                        style: GoogleFonts.merriweather(
                            color: Colors.black, fontSize: 15),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text("${homeCountoller.m1.author_name}",
                          style: GoogleFonts.merriweather(
                              color: Colors.black, fontSize: 15)),
                      SizedBox(
                        height: 2.h,
                      ),
                      SingleChildScrollView(
                          child: Text(
                        "${homeCountoller.m1.book_about}",
                        style: GoogleFonts.merriweather(
                            color: Colors.black, fontSize: 15),
                      )),

                      Text(
                        "${homeCountoller.m1.publish_year}",
                        style: GoogleFonts.merriweather(
                            color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 25.h,
              width: 30.w,
              margin: EdgeInsets.only(left: 35.w, top: 10.h),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "${homeCountoller.m1.image}",
                    fit: BoxFit.fill,
                  )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, blurRadius: 40, offset: Offset(2, 2))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
