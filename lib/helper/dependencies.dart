import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:idr_corner/controller/popular_product_controller.dart';
import 'package:idr_corner/data/api/api_client.dart';
import 'package:idr_corner/data/repository/popular_product_repo.dart';
import 'package:idr_corner/pages/food/popular_food_detail.dart';
import 'package:idr_corner/utils/app_constants.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
