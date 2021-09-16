import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dine_market/app/controllers/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends GetView<HomeController> {
  final homeController = Get.put(HomeController());

  final assetsImage = [
    'assets/images/cardImage.png',
    'assets/images/user_profile.png',
    'assets/images/cardImage.png',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 100;
    final width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      backgroundColor: Color(0XFFF6F7FC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
          ),
          child: Column(
            children: [
              // top bar
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 7),
                height: height * 4.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: width * 39,
                      height: height * 2.9,
                      child: Image(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                    Container(
                      height: height * 4.5,
                      width: height * 4.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/user_profile.png'))),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 5,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 7),
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
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: CarouselSlider.builder(
                  itemCount: assetsImage.length,
                  options: CarouselOptions(
                    height: height * 11,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) =>
                        homeController.setPositionCard(index),
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final assetImage = assetsImage[index];
                    final w = width;

                    return buildCard(assetImage, index, w);
                  },
                ),
              ),
              SizedBox(
                height: height * 1.5,
              ),
              buidIndicator(height, width),

              SizedBox(
                height: height * 3.8,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 8),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            'Categories',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          categorie('abacate', 'Abacate', height, width),
                          categorie('veggie', 'Veggie', height, width),
                          categorie('fish', 'Fish', height, width),
                          categorie('meat', 'Meat', height, width),
                          categorie('dairy', 'Dairy', height, width),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buidIndicator(h, w) {
    return GetX<HomeController>(
      builder: (homeController) {
        return AnimatedSmoothIndicator(
          activeIndex: homeController.activePositionCard.value,
          count: assetsImage.length,
          effect: ExpandingDotsEffect(
            dotColor: Colors.grey,
            activeDotColor: Color(0XFF212121),
            dotHeight: h * 1,
            dotWidth: w * 1.7,
            spacing: w * 1,
          ),
        );
      },
    );
  }
}

Widget buildCard(String assetImages, int index, w) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: w * 7),
    decoration: BoxDecoration(
      color: Color(0xff212121),
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

Widget categorie(String image, String title, double height, double width) {
  return Container(
    child: Column(
      children: [
        Container(
          height: width * 14,
          width: width * 14,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: Color(0XFFFFFF),
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          child: Container(
            height: width * 8,
            width: width * 8,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/$image.png'),
                  fit: BoxFit.contain),
            ),
          ),
        ),
        SizedBox(
          height: height * 2,
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: width * 3.2,
              color: Color(0XFF212121)),
        ),
      ],
    ),
  );
}
