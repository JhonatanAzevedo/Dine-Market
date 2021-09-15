import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final assetsImage = [
    'assets/images/cardImage.png',
    'assets/images/user_profile.png'
  ];

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
                child: Column(
                  children: [
                    Row(
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
                                    image:
                                        AssetImage('assets/images/search.png'),
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
                    SizedBox(
                      height: height * 1.5,
                    ),
                    Container(
                      height: height * 2.2,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Wrap(
                            spacing: height * 1,
                            children: [
                              Chip(
                                label: Text('Fresh'),
                                onDeleted: () {},
                                deleteIcon: Icon(
                                  Icons.close,
                                  size: height * 2,
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.black,
                                labelStyle: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                                visualDensity: VisualDensity.compact,
                                labelPadding:
                                    EdgeInsets.only(left: 8, right: 0),
                              ),
                              Chip(
                                label: Text('Chicken'),
                                onDeleted: () {},
                                deleteIcon: Icon(
                                  Icons.close,
                                  size: height * 2,
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.black,
                                labelStyle: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                                visualDensity: VisualDensity.compact,
                                labelPadding:
                                    EdgeInsets.only(left: 8, right: 0),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 4,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff212121),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: height * 11,
                child: CarouselSlider.builder(
                  itemCount: assetsImage.length,
                  options: CarouselOptions(
                    height: height * 11,
                    viewportFraction: 1,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final assetImage = assetsImage[index];
                    final w = width;

                    return buildCard(assetImage, index, w);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCard(String assetImages, int index, w) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Fresh Products',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.berkshireSwash(
                      fontSize: w * 6,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Always provide best quality \n ingredients',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: w * 2.6,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                  image: AssetImage(assetImages), fit: BoxFit.cover),
            ),
            width: w * 26,
          )
        ],
      ),
    ),
  );
}
