

import 'package:Ecommerce/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store{
  final FirebaseFirestore firestore=FirebaseFirestore.instance;

  addProduct(Product product)
  {
firestore.collection('Products').add({
  'Name':product.pName,
  'Price':product.pPrice,
  'Description':product.pDescription,
  'Category':product.pCategory,
  'Location':product.pLocation
});
  }

   // ignore: missing_return
   Stream<QuerySnapshot> loadProducts()
  { 
 return firestore.collection('Products').snapshots();
  }

deleteProduct(id)
{
  firestore.collection('Products').doc(id).delete();
}

editProduct(data,id){
  firestore.collection('Products').doc(id).update(data);


  
}
}