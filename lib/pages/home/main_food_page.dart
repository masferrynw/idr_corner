import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idr_corner/pages/home/food_page_body.dart';
import 'package:idr_corner/utils/colors.dart';
import 'package:idr_corner/widgets/big_text.dart';
import 'package:idr_corner/widgets/small_text.dart';

import 'package:idr_corner/utils/dimensions.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State {
  @override
  Widget build(BuildContext context) {
    //print("Tinggi aplikasi ini adalah" +
    //MediaQuery.of(context).size.height.toString());
    return Scaffold(
        body: Column(
      //Bagian Header
      children: [
        Container(
            child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height45, bottom: Dimensions.height15),
                padding: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(text: "Indonesia", color: AppColors.mainColor),
                        Row(
                          children: [
                            SmallText(text: "Bekasi", color: Colors.black54),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimensions.width45,
                        height: Dimensions.height45,
                        child: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: Dimensions.iconSize24,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                ))),
        //Bagian Body
        Expanded(
            child: SingleChildScrollView(
          child: FoodPageBody(),
        )),
      ],
    ));
  }
}
