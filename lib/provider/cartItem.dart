import 'package:Ecommerce/models/product.dart';

import 'package:flutter/cupertino.dart';
class CartItem extends ChangeNotifier{

  List<Product> products=[];

  addProduct(Product product){
products.add(product);
notifyListeners();
  }

}