import 'package:Ecommerce/provider/admin.dart';
import 'package:Ecommerce/provider/cartItem.dart';
import 'package:Ecommerce/provider/modelhud.dart';
import 'package:Ecommerce/screens/Home.dart';
import 'package:Ecommerce/screens/addproduct.dart';
import 'package:Ecommerce/screens/adminPage.dart';
import 'package:Ecommerce/screens/cartScreen.dart';
import 'package:Ecommerce/screens/edit.dart';
import 'package:Ecommerce/screens/productInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Ecommerce/screens/login_screen.dart';
import 'package:Ecommerce/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'screens/manageproduct.dart';

main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
          return MultiProvider(
        providers: [
           ChangeNotifierProvider<ModelHud>(
           create: (context) => ModelHud(),
          ),
          ChangeNotifierProvider<Admin>(
           create: (context) => Admin(),
          ),
          ChangeNotifierProvider<CartItem>(
           create: (context) => CartItem(),
          ),
          ],
            child: MaterialApp(
            initialRoute: LoginScreen.id ,
            routes :{
              LoginScreen.id:(context) =>LoginScreen(),
              Signupscreen.id:(context) =>Signupscreen(),
              Home.id:(context) =>Home(),
               AdminPage.id:(context) =>AdminPage(),
               AddProduct.id:(context) =>AddProduct(),
               
              ManageProduct.id:(context) =>ManageProduct(),
              EditProduct.id:(context) =>EditProduct(),
              ProductInfo.id:(context) =>ProductInfo(),
              CartScreen.id:(context) =>CartScreen(),
                },
      ),
          );
    
    
      }
     ); 
     }}