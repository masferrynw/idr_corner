import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_corner/controller/popular_product_controller.dart';
import 'package:idr_corner/utils/colors.dart';
import 'package:idr_corner/utils/dimensions.dart';
import 'package:idr_corner/widgets/app_column.dart';
import 'package:idr_corner/widgets/big_text.dart';
import 'package:idr_corner/widgets/icon_and_text_widget.dart';
import 'package:idr_corner/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions
      .pageViewContainer; //jadi hanya menampilkan tampilan 80% dari slide gambar
  //fungsi slider zoom out - zoom in
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController
            .page!; //mendapatkan nilai pergerakan dari slider gambar
      });
    });
  }

  //fungsi untuk membuat nilai pageController sebelumnya hilang
  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Column(
      children: [
        //slide section
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return Container(
            //color: Colors.redAccent,
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                //itemCount: popularProducts
                //.popularProductList.length, //dihitung dari nilai value
                itemBuilder: (context, position) {
                  return _buildPageItem(
                      position); //posisi untuk index (yg pertama)
                }),
          );
        }),
        //dots navigation
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return new DotsIndicator(
            dotsCount: 5,
            position: _currPageValue,
            decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeColor: AppColors.mainColor,
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          );
        }),
        //popular text
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment.end, //memposisikan text berada di bawah
            children: [
              BigText(text: "Popular"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(
                    text: "Food Pairing",
                    color: Colors.black26,
                  ))
            ],
          ),
        ),
        //list menu
        ListView.builder(
            physics: NeverScrollableScrollPhysics(), //dynamic static list view
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height10), //memberi space
                child: Row(
                  children: [
                    //image menu section
                    Container(
                      width: Dimensions.ListViewImageSize120,
                      height: Dimensions.ListViewImageSize120,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white38,
                          image: DecorationImage(
                              fit: BoxFit
                                  .cover, //supaya tidak ada celah di container
                              image:
                                  AssetImage("assets/image/kerak-telor.png"))),
                    ),
                    //text container
                    Expanded(
                      //funsgsi expanded untuk memaksimalkan space yg tersisa
                      child: Container(
                        height: Dimensions.ListViewTextContSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight:
                                  Radius.circular(Dimensions.radius20)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: "Makanan bergizi di Jakarta"),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              SmallText(text: "Dengan citarasa dari Jakarta"),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(
                                      icon: Icons.circle_sharp,
                                      text: "Normal",
                                      iconColor: AppColors.iconColor1),
                                  IconAndTextWidget(
                                      icon: Icons.location_on,
                                      text: "1.75km",
                                      iconColor: AppColors.mainColor),
                                  IconAndTextWidget(
                                      icon: Icons.access_time_rounded,
                                      text: "31min",
                                      iconColor: AppColors.iconColor2)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),

        //text container
      ],
    );
  }

  //Container pertama
  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height *
          (1 - currScale) /
          2; //mengubah ketinggian gambar di prev page
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0); //widget flutter
    } else if (index == _currPageValue.floor() + 1) {
      //berfungsi untuk menuju ke slide selanjutnya
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height *
          (1 - currScale) /
          2; //mengubah ketinggian gambar di next page
      matrix = Matrix4.diagonal3Values(1, currScale, 1); //widget flutter
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0); //widget flutter

    } else if (index == _currPageValue.floor() - 1) {
      //berfungsi untuk menuju ke slide selanjutnya
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height *
          (1 - currScale) /
          2; //mengubah ketinggian gambar di next page
      matrix = Matrix4.diagonal3Values(1, currScale, 1); //widget flutter
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0); //widget flutter

    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
        transform: matrix,
        child: Stack(children: [
          Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover, //supaya tidak ada celah di container
                    image: AssetImage("assets/image/kerak-telor.png")),
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(
                    left: Dimensions.width30,
                    right: Dimensions.width30,
                    bottom: Dimensions.height30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                      BoxShadow(color: Colors.white, offset: Offset(0, 0)),
                      BoxShadow(
                          color: Color.fromARGB(255, 112, 89, 89),
                          offset: Offset(0, 0))
                    ]),
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height15, left: 15, right: 15),
                  child: AppColumn(
                    text: "Kerak Telor",
                  ),
                ),
              )),
        ] //Childern
            ));
  }
}
