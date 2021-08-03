import 'package:get/get.dart';

import '../api/api_services.dart';
import '../models/product_model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(false);
      var products = await ApiServices.fetchProducts();
      if (products != null) productList.assignAll(products);
    } finally {
      isLoading(true);
    }
  }
}
