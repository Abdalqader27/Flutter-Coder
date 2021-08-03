import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/product_controllers.dart';

class ProductListViewScreen extends StatelessWidget {
  ProductListViewScreen({Key? key}) : super(key: key);
  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products Api")),
      body: Obx(() {
        if (!_productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: _productController.productList.length,
              itemBuilder: (_, index) {
                return Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            margin: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                _productController.productList[index].imageLink,
                                width: 150,
                                height: 100,
                                fit: BoxFit.fill,
                                color: Colors.purple,
                                colorBlendMode: BlendMode.color,
                              ),
                            ),
                          ),
                          Flexible(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_productController.productList[index].name, style: const TextStyle(fontSize: 18)),
                              Text(_productController.productList[index].brand,
                                  style: const TextStyle(fontSize: 14, color: Colors.grey)),
                              Text(_productController.productList[index].category,
                                  style: const TextStyle(fontSize: 14, color: Colors.grey)),
                            ],
                          ))
                        ],
                      ),
                      const SizedBox(height: 3)
                    ],
                  ),
                );
              });
        }
      }),
    );
  }
}
