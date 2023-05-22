import 'package:api_demo/controller/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(child: GetX<ShoppingController>(
            builder: (controller) {
              return ListView.builder(
                itemCount: controller.product.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${shoppingController.product[index].id}'),
                        Image.network('${shoppingController.product[index].ProductImage}'),
                        // Text(
                        //     '${shoppingController.product[index].ProductImage}'),
                        Text(
                            '${shoppingController.product[index].ProductName}'),
                        Text(
                            '${shoppingController.product[index].ProductDescription}'),
                        Text('${shoppingController.product[index].Price}'),
                      ],
                    ),
                  );
                },
              );
            },
          )),
          Text('total Amount'),
          SizedBox(
            height: 100,
          )
        ]),
      ),
    );
  }
}
