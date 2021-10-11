



import 'package:Ecommerce/models/product.dart';
import 'package:Ecommerce/provider/cartItem.dart';
import 'package:Ecommerce/screens/cartScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProductInfo extends StatefulWidget {
 
 static String id='ProductInfo';
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int quantity=1;
  @override
  Widget build(BuildContext context) {
   Product product=ModalRoute.of(context).settings.arguments;
    return Scaffold(

    body: Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          

        child: Image(
          fit:BoxFit.fill,

       image: AssetImage(product.pLocation),
          ),
        ),
       Padding(
     padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Container(
                                     
                                     
     height: MediaQuery.of(context).size.height * .1,
      child: Row(
       mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: <Widget>[
        
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios)),
         
         
         GestureDetector(
           onTap: (){
             Navigator.pushNamed(context, CartScreen.id);
           },
           child: Icon(Icons.shopping_cart))
         ],
        ),
                                
      ),
       ),
         Positioned(
           bottom: 0,
            child: Column(
              children:<Widget> [
                Opacity(
                   child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height *.3,
                   child: Padding(

                     padding: const EdgeInsets.all(20),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>
                     [
                       Text(
                         product.pName,
                         style:TextStyle(fontSize: 16,
                         fontWeight:FontWeight.bold),
                       ),
                       SizedBox(height: 10),
                        Text('\ Description : ${product.pDescription}',
                         style:TextStyle(fontSize: 16,
                         fontWeight:FontWeight.bold),
                       ),
                       SizedBox(height: 10),
                        Text('\Price : ${product.pPrice}',
                         style:TextStyle(fontSize: 16,
                         fontWeight:FontWeight.bold),
                       ),
                       SizedBox(height:10),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children:<Widget> [
                          ClipOval(
                            child:Material(color: Colors.green,
                            child: GestureDetector(
                              onTap: add,
                      child: SizedBox(
                      child:Icon(Icons.add),
                         height: 28,
                            width: 28,
                         ),
                        ),
                         )
                        ),
                              
                     Text(
                   quantity.toString(),
                     style: TextStyle(fontSize: 40)
                              
                      ),
                              
                          ClipOval(
                           child:Material(color: Colors.green,
                          child: GestureDetector(
                         onTap: subtract,
                           child: SizedBox(
                            child:Icon(Icons.remove),
                             height: 28,
                              width: 28,
                              ),
                             ),
                              )
                              ),
                                                                                          
                            ],
                               )
                                                                                                                 
                            ],),
                          ),
                                                                                                              
                          ),
                               opacity: .5,
                         ),
                          ButtonTheme(
                                                                                                           
                        minWidth: MediaQuery.of(context).size.width,
                       height: MediaQuery.of(context).size.height * .09 ,
                      child: Builder(
                    builder:(context)=> RaisedButton(
                        shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10))
                          ),
                          color: Colors.white70,
                          onPressed: (){
                        addtocart(context,product);
                                        
                                        
                                        },
                                                                                                                    
                                            child: Text('Add to cart'.toUpperCase(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                                                                                                    
                                                                                                                    
                                             ),
                                              ),
                                            ),
                                                 ],
                                            ),
                                          )                     
                                                                                                                        
                                          ],
                                        ),
                                                                                                                        
                                        );
                                       }
                                                                                    
                                      subtract() {
                                    if(quantity>0){
                                     setState(() {
                                     quantity --;
                                      });
                                       }
                                      }
                                                      
                                  add() {
                                 setState(() {
                                  quantity ++;
                                  });
                                                          
                                  }
                        
                          void addtocart(context,product) {
                             CartItem cartItem =Provider.of<CartItem>(context,listen: false)  ;   
                          product.pQuantity=quantity;   
                        bool exist =false;                                                    
                         
                         var productsInCart=cartItem.products;
                         for(var productInCart in productsInCart)
                         {
                           if(productInCart == product)
                           {
                             exist=true;
                           }
                         }

                         if(exist){
                           Scaffold.of(context).showSnackBar(SnackBar(
                             content: Text('you\'ve added this item befor'),
                           ));
                         }else {
                         
                         cartItem.addProduct(product);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                  content:Text('Added to cart'),
                )
                );}
                          }
                    
                              
}