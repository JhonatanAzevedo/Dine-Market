import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 100;
    final width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
        backgroundColor: Color(0XFFF6F7FC),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 30, right: 30),
            child: Column(
              children: [
                // top bar
                Container(
                  height: height * 4.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width * 39,
                        height: height * 2.9,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                        )),
                      ),
                      Container(
                        child: Container(
                          height: height * 4.5,
                          width: height * 4.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/user_profile.png'))),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 5,
                ),
                Container(
                  height: width * 11,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: width * 11,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: [
                            Container(
                              height: width * 11,
                              width: width * 11,
                              child: TextButton(
                                onPressed: () {},
                                child: Image(
                                  image: AssetImage('assets/images/search.png'),
                                ),
                              ),
                            ),
                            Container(
                              width: width * 60,
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Search',
                                    border: InputBorder.none),
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 3.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: width * 11,
                        width: width * 11,
                        decoration: BoxDecoration(
                          color: Color(0XFF212121),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: TextButton(
                            onPressed: () {},
                            child: Image(
                              image: AssetImage('assets/images/sliders.png'),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
