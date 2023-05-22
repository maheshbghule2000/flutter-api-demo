import 'dart:html';

import 'package:api_demo/model/product_model.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var product = <ProductModel>[].obs;
//   var product = List<ProductModel>().obs;

  @override
  void onInit() {
    super.onInit();
    FetchProducts();
  }

  void FetchProducts() async {
    await Future.delayed(Duration(seconds: 4));
    var productResult = [
      ProductModel(
        id: 1,
        Price: 444.00,
        ProductName: 'kashmiri mithai',
        ProductDescription:
            'Tosha is famous and is being made in parts of north Kashmir. It has a higher demand with people from other parts of Kashmir ordering the delicacy," Parvez added. Tosha is prepared with refined flour, sugar and dry fruits.',
        ProductImage:
            'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
      ),
      ProductModel(
        id: 2,
        Price: 44.00,
        ProductName: 'kashmiri mithai',
        ProductDescription:
            'Tosha is famous and is being made in parts of north Kashmir. It has a higher demand with people from other parts of Kashmir ordering the delicacy," Parvez added. Tosha is prepared with refined flour, sugar and dry fruits.',
        ProductImage:
            'https://media.thekashmirmonitor.net/wp-content/uploads/2021/12/Kong_Phirin_Semolina_Saffron_Pudding.jpg',
      ),
      ProductModel(
        id: 3,
        Price: 125.00,
        ProductName: 'kashmiri mithai',
        ProductDescription:
            'Tosha is famous and is being made in parts of north Kashmir. It has a higher demand with people from other parts of Kashmir ordering the delicacy," Parvez added. Tosha is prepared with refined flour, sugar and dry fruits.',
        ProductImage:
            'https://media.thekashmirmonitor.net/wp-content/uploads/2021/12/Kong_Phirin_Semolina_Saffron_Pudding.jpg',
      ),
      ProductModel(
        id: 4,
        Price: 120.00,
        ProductName: 'kashmiri mithai',
        ProductDescription:
            'Tosha is famous and is being made in parts of north Kashmir. It has a higher demand with people from other parts of Kashmir ordering the delicacy," Parvez added. Tosha is prepared with refined flour, sugar and dry fruits.',
        ProductImage:
            'https://media.thekashmirmonitor.net/wp-content/uploads/2021/12/Kong_Phirin_Semolina_Saffron_Pudding.jpg',
      )
    ];
    product.value = productResult;
  }
}
