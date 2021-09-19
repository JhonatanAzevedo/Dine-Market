import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 100;
    final width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: width * 7, right: width * 7, bottom: width * 3.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height * 6,
                  width: height * 6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: IconButton(
                    icon: Container(
                      child: Padding(
                        padding: EdgeInsets.all(height * 0.4),
                        child: Image(
                          image: AssetImage('assets/images/icon.png'),
                        ),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Container(
                  height: height * 6,
                  width: height * 6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: IconButton(
                    icon: Container(
                      child: Padding(
                        padding: EdgeInsets.all(height * 0.4),
                        child: Image(
                          image: AssetImage('assets/images/buy.png'),
                        ),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: width * 5),
              child: cardProducts(width, height),
            ),
          )
        ],
      )),
    );
  }
}

Widget cardProducts(width, height) {
  return Container(
    child: Stack(
      children: [
        Positioned(
          bottom: 0,
          left: width * 17,
         child: Transform.rotate(
           angle: 0.8,
            child: Container(
            height: width * 3,
            width: width * 3,
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(3))
            ),
          ),
         ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: width * 1.5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: width * 37,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height * 1.8),
            child: Row(
              children: [
                Container(
                  width: width * 19,
                  child: Text(
                    'Size',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: height * 1.6),
                  ),
                ),
                Container(
                  width: width * 18,
                  child: Padding(
                    padding: EdgeInsets.only(right: width * 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: height * 3,
                          width: height * 3,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Text(
                            'S',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: height * 1.5,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          height: height * 3,
                          width: height * 3,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0XFFF6F7FC),
                              borderRadius: BorderRadius.all(Radius.circular(50))),
                          child: Text(
                            'L',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: height * 1.5,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
