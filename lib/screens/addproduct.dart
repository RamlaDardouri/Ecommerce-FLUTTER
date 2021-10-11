
import 'package:Ecommerce/models/product.dart';
import 'package:Ecommerce/screens/manageproduct.dart';
import 'package:flutter/material.dart';
import 'package:Ecommerce/services/store.dart';

// ignore: must_be_immutable
class AddProduct extends StatelessWidget {
 static String id='AddProduct';
 String name,price,description,category,location;
  final GlobalKey<FormState> globalKey=GlobalKey<FormState>();
 final store =Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white70,
      body: Form(
        key: globalKey,
              child: ListView(
              children:<Widget>[
                SizedBox(
height: MediaQuery.of(context).size.height * .2,
                ),
               Column(
         //mainAxisAlignment: MainAxisAlignment.center,
         
         children: <Widget>[
           SizedBox(height:35),
                   Padding(padding: const EdgeInsets.symmetric(horizontal:20),
                    
                    child: TextFormField(
                      
                                 
                      onChanged: (value){
                        name=value.trim();
                     },
                       decoration: InputDecoration(
                         hintText: 'Product name',
                        
                         filled: true,
                         fillColor: Colors.white,
                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                           borderSide:BorderSide(
                           color:Colors.white
                         )),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                           borderSide:BorderSide(
                           color:Colors.white))
                       ),

                     ),),


SizedBox(height:10),
                   Padding(padding: const EdgeInsets.symmetric(horizontal:20),
                    
                    child: TextFormField(
                      
                                 
                      onChanged: (value){
                        price=value.trim();
                     },
                       decoration: InputDecoration(
                         hintText: 'Product price',
                        
                         filled: true,
                         fillColor: Colors.white,
                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                           borderSide:BorderSide(
                           color:Colors.white
                         )),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                           borderSide:BorderSide(
                           color:Colors.white))
                       ),

                     ),),





                     SizedBox(height:10),
                   Padding(padding: const EdgeInsets.symmetric(horizontal:20),
                    
                    child: TextFormField(
                                 
                      onChanged: (value){
                        description=value.trim();
                     },
                       decoration: InputDecoration(
                         hintText: 'Product déscription',
                        
                         filled: true,
                         fillColor: Colors.white,
                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                           borderSide:BorderSide(
                           color:Colors.white
                         )),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                           borderSide:BorderSide(
                           color:Colors.white))
                       ),

                     ),),


                     SizedBox(height:10),
                   Padding(padding: const EdgeInsets.symmetric(horizontal:20),
                    
                    child: TextFormField(
                                    
                      onChanged: (value){
                        category=value.trim();
                     },
                       decoration: InputDecoration(
                         hintText: 'Product category',
                        
                         filled: true,
                         fillColor: Colors.white,
                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                           borderSide:BorderSide(
                           color:Colors.white
                         )),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                           borderSide:BorderSide(
                           color:Colors.white))
                       ),

                     ),),


                     SizedBox(height:10),
                   Padding(padding: const EdgeInsets.symmetric(horizontal:20),
                    
                    child: TextFormField(
                      
                          onChanged: (value){
                        location=value.trim();
                     },
                      
                       decoration: InputDecoration(
                         hintText: 'Product location',
                        
                         filled: true,
                         fillColor: Colors.white,
                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                           borderSide:BorderSide(
                           color:Colors.white
                         )),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                           borderSide:BorderSide(
                           color:Colors.white))
                       ),

                     ),),


                       SizedBox(height:10),
                       RaisedButton( shape:RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20) ),
                         onPressed:() {
                           
                           globalKey.currentState.validate();
                             globalKey.currentState.save();

                             store.addProduct((Product(
                              
                              pName: name,
                              pPrice: price,
                              pDescription: description,
                              pCategory: category,
                              pLocation: location 
                              )));

                               Navigator.pushNamed(context, ManageProduct.id);
                           },


                       
                       child: Text('Add prodect',style: TextStyle(color: Colors.white),),
                       color: Colors.black,
                       )






         ],

        ),],
              ),
      ),
      
    );
  }
}