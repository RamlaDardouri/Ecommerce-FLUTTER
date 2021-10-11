

import 'package:Ecommerce/models/product.dart';
import 'package:Ecommerce/provider/cartItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  
  static String id='CartScreen';
  @override
  Widget build(BuildContext context) {
    
    List <Product> products=Provider.of<CartItem>(context).products;
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    
    final double appBarHeight=AppBar().preferredSize.height;
    final double statusBarHeight=MediaQuery.of(context).padding.top;
    
    return Scaffold(

 appBar: AppBar(
 title: Text('MyCart',style: TextStyle(color: Colors.black),),
 backgroundColor: Colors.white,
 elevation: 0,
 leading: GestureDetector(
   onTap: (){
     Navigator.pop(context);
   },
    child: Icon(
     Icons.arrow_back,color: Colors.black,
   ),
 ),


 ),


      body: Column(
        children:<Widget> [
          LayoutBuilder(

            builder: (context,constrains){
              if(products.isEmpty){
              
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: screenHeight -
                  statusBarHeight-
                  appBarHeight-
                  (screenHeight * .09),
                  

                 child: ListView.builder(
                   itemBuilder:
                   (context,index)
                   {
                     return Padding(
                       padding: const EdgeInsets.all(15),
                       child:Container(
                         color: Colors.grey,
                         height: screenHeight * .15,
                         child: Row(
                           children: <Widget>[
                   CircleAvatar(
                     radius:screenHeight * .15/2,
                     backgroundImage: AssetImage(products[index].pLocation),

                   )
                           ,
                           Row(
                  children: <Widget> [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget> [
                          Text(products[index].pName,style:TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
                          Text('\ Quantity : ${products[index].pQuantity.toString()}',style:TextStyle(fontWeight:FontWeight.bold),),
                        ],
                        ),
                    )

                           ],
                           )
                           
                           ],
                           ),

                       )
                     
                     );

                   },
                   

                  ),
                ),
              );
            }
            

          else{
            return Container(
              height: screenHeight -
              (screenHeight * .09) -
              appBarHeight -
              statusBarHeight,
               child: Center(
                child:Text('cart is Empty'),
                ),
            ) ;
          }
            }),
       
       ButtonTheme(
         minWidth: screenWidth,
         height: screenHeight * .09,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                    topRight:Radius.circular(10),
                  topLeft: Radius.circular(10),
                  )),
           onPressed: (){},
           child: Text('order'.toUpperCase()),
           color: Colors.grey,
           
           
           
           ),
       ),

        ],
      ),
      
    );
  }
}