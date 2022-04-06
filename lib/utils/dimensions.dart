import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //dimension container food
  //height device/320 = 825.46/310
  static double pageView = screenHeight / 2.66;
  //height device/220 =  825.46/210
  static double pageViewContainer = screenHeight / 3.93;
  //height device/120 = 825.46/110
  static double pageViewTextContainer = screenHeight / 7.50;

  //dynamic height padding and margin
  //height device/10 = 825.46/10
  static double height8 = screenHeight / 164;
  static double height10 = screenHeight / 82;
  //height device/20 = 825.46/20
  static double height20 = screenHeight / 41.2;
  //height device/15 = 825.46/15
  static double height15 = screenHeight / 55;
  //height device/30 = 825.46/15
  static double height30 = screenHeight / 27.50;
  //height device/45 = 825.46/15
  static double height45 = screenHeight / 18.30;

  //dynamic width padding and margin
  //height device/10 = 825.46/10
  static double width10 = screenHeight / 82.5;
  //height device/20 = 825.46/20
  static double width20 = screenHeight / 41.2;
  //height device/15 = 825.46/15
  static double width15 = screenHeight / 55.03;
  //height device/30 = 825.46/15
  static double width30 = screenHeight / 27.51;
  static double width45 = screenHeight / 18.34;

  //font size
  //height device/20 = 825.46/20
  static double font20 = screenHeight / 41.2;
  static double font26 = screenHeight / 31.75;
  static double font16 = screenHeight / 51.59;
  static double font14 = screenHeight / 58.96;

  //border radius
  static double radius20 = screenHeight / 41.2;
  static double radius30 = screenHeight / 27.51;
  static double radius15 = screenHeight / 55.03;

  //icon size
  static double iconSize24 = screenHeight / 34.39;
  static double iconSize16 = screenHeight / 51.59;

  //List view size
  static double ListViewImageSize120 = screenHeight / 6.88;
  static double ListViewTextContSize = screenHeight / 8.25;

  //popular food
  static double popularFoodImageSize = screenHeight / 2.36;

  //bottom height
  static double bottomHeightBar = screenHeight / 6.88;
}
