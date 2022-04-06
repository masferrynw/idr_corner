import 'package:get/get.dart';
import 'package:idr_corner/data/repository/popular_product_repo.dart';
import 'package:idr_corner/models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo
        .getPopularProductList(); //await karena fungsi di repo pakai future
    if (response.statusCode == 200) {
      //return code dari http kalo success itu 200
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print(_popularProductList);
      update();
    } else {}
  }
}
