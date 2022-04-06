import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idr_corner/utils/colors.dart';
import 'package:idr_corner/utils/dimensions.dart';
import 'package:idr_corner/widgets/big_text.dart';
import 'package:idr_corner/widgets/icon_and_text_widget.dart';
import 'package:idr_corner/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(
        text: text,
        size: Dimensions.font26,
      ),
      SizedBox(
        height: Dimensions.height8,
      ),
      Row(
        children: [
          Wrap(
            children: List.generate(
                5,
                (index) => Icon(
                      Icons.star,
                      color: AppColors.mainColor,
                      size: 15,
                    )),
          ),
          SizedBox(
            width: Dimensions.height10,
          ),
          SmallText(text: "4.5"),
          SizedBox(
            width: Dimensions.height10,
          ),
          SmallText(text: "1287"),
          SizedBox(
            width: Dimensions.height10,
          ),
          SmallText(text: "comments")
        ],
      ),
      SizedBox(
        height: Dimensions.height15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    ]);
  }
}
