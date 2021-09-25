import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dine_market/app/controllers/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends GetView<HomeController> {
  final homeController = Get.put(HomeController());

  // array de imagens dos banner
  final assetsImage = [
    'assets/images/cardImage.png',
    'assets/images/fruits.png',
    'assets/images/fish.png',
    'assets/images/veggie.png',
    'assets/images/meat.png',
    'assets/images/dairy.png',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 100;
    final width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      backgroundColor: Color(0XFFF6F7FC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 7),
                  height: height * 4.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //containar da logo
                      Container(
                        alignment: Alignment.centerLeft,
                        width: width * 39,
                        height: height * 2.9,
                        child: Image(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                      ),

                      //containar do perfil
                      Container(
                        height: height * 4.5,
                        width: height * 4.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/user_profile.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height * 5),

                //Containe que contem o Search e o botao de flitros
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 7),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Container que contem a lupa, search e o botao de filtra.
                          Container(
                            height: width * 11,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(
                              children: [
                                //containe da lupa
                                Container(
                                  height: width * 11,
                                  width: width * 11,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/search.png'),
                                    ),
                                  ),
                                ),

                                //container do Seach
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

                          //container do botao de flitra
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
                              ),
                            ),
                          ),
                        ],
                      ),

                      // container dos butao do Chip (os exemplos de flitros)
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
                                    fontWeight: FontWeight.w600,
                                  ),
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

                SizedBox(height: height * 4),

                // container do Carousel, onde passa os banner.
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
                SizedBox(height: height * 1.5),

                //widget para mostra as indicaçoes do banner que fica em baixo dele.
                buidIndicator(height, width),

                SizedBox(height: height * 3.8),

                //Container das categorias de alimentos.
                Container(
                  child: Column(
                    children: [
                      //Container do texto "CATEGORIES".
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 7),
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

                      //Container das imagens da categorias dos alimentos.
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            categorie('fruits', 'Fruits', height, width),
                            categorie('veggie', 'Veggie', height, width),
                            categorie('fish', 'Fish', height, width),
                            categorie('meat', 'Meat', height, width),
                            categorie('dairy', 'Dairy', height, width),
                          ],
                        ),
                      ),

                      SizedBox(height: height * 3.8),

                      // container geral onde era conter o texto "RECOMENDATION" , "SELL ALL", e as imagens.
                      Container(
                        child: Column(
                          children: [
                            //Container onde tera o texto "RECOMENDATION" e o "SELL ALL".
                            Container(
                              margin:
                                  EdgeInsets.symmetric(horizontal: width * 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Recomendation',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    'See all',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: height * 2),

                            //Conteiner dos card do recomendation.
                            Container(
                              margin: EdgeInsets.only(
                                  top: height * 2, bottom: height * 2),
                              height: height * 31.5,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  SizedBox(width: width * 7),
                                  productDark(width, height),
                                  SizedBox(width: width * 7),
                                  productWhite(width, height),
                                  SizedBox(width: width * 7),
                                  productDark(width, height),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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

//widget para mostra as indicaçoes do banner que fica em baixo dele.
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

//Widget que mostara os card que passa para o lado.
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
                //container do texto "FRESH PRODUCTS".
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
                //Container do texto "Always provide best quality \n ingredients".
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

          //Container que mostra a imagem dentro do card.
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

//Widget que mostra todas as categorias de alimentos.
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

          //Container que tem a imagem de cada categoria.
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

        SizedBox(height: height * 2),

        //nomes de cada categoria de alimento.
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

//Widget que mostra o card de recomendation na cor escura.
Widget productDark(double width, double height) {
  return Container(
    width: width * 42,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Color(0XFF212121),
        borderRadius: BorderRadius.all(Radius.circular(20))),
    child: Column(
      children: [
        //container que tem a imagem de dentro do card.
        Container(
          margin: EdgeInsets.only(
            right: height * 2,
            left: height * 2,
            top: height * 2,
          ),
          height: height * 16,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/chicken.png'),
            ),
          ),
        ),

        //container que tem o texto do produto do card.
        Container(
          width: width * 42,
          height: height * 5,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Chicken Leg',
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: width * 4.3),
            ),
          ),
        ),

        Container(
          alignment: Alignment.center,
          height: height * 8,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * 16,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //mostra o cifrao do real.
                      Container(
                        height: height * 8,
                        child: Padding(
                          padding: EdgeInsets.only(top: height * 2),
                          child: Text(
                            '\$',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: width * 3.5),
                          ),
                        ),
                      ),

                      //mostra o valor do produto do card.
                      Container(
                        alignment: Alignment.topCenter,
                        height: height * 8,
                        child: Padding(
                          padding: EdgeInsets.only(top: height * 1.3),
                          child: Text(
                            '10',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: width * 6.8,
                            ),
                          ),
                        ),
                      ),

                      //mostra o valor em centavos do produto do card.
                      Container(
                        height: height * 7.2,
                        child: Padding(
                          padding: EdgeInsets.only(top: height * 2),
                          child: Text(
                            '.50',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: width * 3.5,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                //botao de compra o produto.
                Container(
                  width: width * 16,
                  height: height * 4.8,
                  child: TextButton(
                    onPressed: () => Get.toNamed('/products-details'),
                    child: Text(
                      'Order',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: width * 3.5,
                        color: Colors.white,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0XFF585858),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

//Widget que mostra o card de recomendation na cor branca.
Widget productWhite(double width, double height) {
  return Container(
    width: width * 42,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))),
    child: Column(
      children: [
        //container que tem a imagem de dentro do card.
        Container(
          margin: EdgeInsets.only(
            right: height * 2,
            left: height * 2,
            top: height * 2,
          ),
          height: height * 16,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/avocado.png'),
            ),
          ),
        ),

        //container que tem o texto do produto do card.
        Container(
          width: width * 42,
          height: height * 5,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Avocado',
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: width * 4.3),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: height * 8,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * 16,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //mostra o cifrao do real.
                      Container(
                        height: height * 8,
                        child: Padding(
                          padding: EdgeInsets.only(top: height * 2),
                          child: Text(
                            '\$',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: width * 3.5),
                          ),
                        ),
                      ),

                      //mostra o valor do produto do card.
                      Container(
                        alignment: Alignment.topCenter,
                        height: height * 8,
                        child: Padding(
                          padding: EdgeInsets.only(top: height * 1.3),
                          child: Text(
                            '6',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: width * 6.8,
                            ),
                          ),
                        ),
                      ),

                      //mostra o valor em centavos do produto do card.
                      Container(
                        height: height * 7.2,
                        child: Padding(
                          padding: EdgeInsets.only(top: height * 2),
                          child: Text(
                            '.50',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: width * 3.5,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                //botao de compra o produto.
                Container(
                  width: width * 16,
                  height: height * 4.8,
                  child: TextButton(
                    onPressed: () => Get.toNamed('/products-details'),
                    child: Text(
                      'Order',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: width * 3.5,
                        color: Colors.white,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0XFF585858),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
