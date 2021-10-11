import 'package:Ecommerce/screens/addproduct.dart';
import 'package:flutter/material.dart';

import 'manageproduct.dart';

class AdminPage extends StatelessWidget {
  static String id='AdminPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white70,
    body:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width:double.infinity,
        ),
        RaisedButton(onPressed: () {
          Navigator.pushNamed(context, AddProduct.id);

        },
        child: Text('Add Product'),
        
        ),
        RaisedButton(onPressed: () {
          Navigator.pushNamed(context, ManageProduct.id);

        },
        child: Text('List product'),
        
        ),
        RaisedButton(onPressed: () {
         

        },
        child: Text('view orders'),
        
        )
      ],
      )
      
    );
  }
}