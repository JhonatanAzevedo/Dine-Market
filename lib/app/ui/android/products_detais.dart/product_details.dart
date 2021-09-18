import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 100;
    final width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      /* appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0XFFF6F7FC),
        leadingWidth: width * 25,
        leading: new IconButton(
          icon: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
            child: Icon(Icons.arrow_back_outlined, color: Color(0XFF212121), size: height * 2,),
          
          ),
          onPressed: () => Navigator(),
        ),
      ), */
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.only(left: width * 7, right: width * 7),
        child: Column(
          children: [
            Container(
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
          ],
        ),
      )),
    );
  }
}
