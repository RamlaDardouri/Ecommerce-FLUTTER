

import 'package:Ecommerce/models/product.dart';
import 'package:Ecommerce/screens/cartScreen.dart';
import 'package:Ecommerce/screens/productInfo.dart';

import 'package:Ecommerce/services/auth.dart';
import 'package:Ecommerce/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';




class Home extends StatefulWidget {
  static String id='Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  final auth=Auth();
   User loggedUser;
  int tabBarIndex=0;
  final store=Store();
  int bottmBarIndex=0;
  List <Product> _products;
  
  
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DefaultTabController(
          length: 4,
        child: Scaffold(
          
        bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
       currentIndex: bottmBarIndex,
       fixedColor: Colors.red,
       onTap: (value) {
         setState(() {
           bottmBarIndex=value;
         });

       },
       
       items: [
             
               BottomNavigationBarItem(
label: 'test',
                icon: Icon(Icons.person
              )
              ),
               BottomNavigationBarItem(
label: 'test',
                icon: Icon(Icons.person
              )
              ),
               BottomNavigationBarItem(
label: 'test',
                icon: Icon(Icons.person
              )
              ),
               BottomNavigationBarItem(
label: 'test',
                icon: Icon(Icons.person
              )
              )
            ],
          ),
          backgroundColor: Colors.white70,
        appBar:
         AppBar(backgroundColor: Colors.grey,
               elevation: 0,
               bottom: TabBar(
         indicatorColor: Colors.red,
          onTap: (value){
            setState(() {
              tabBarIndex=value;
            });
            
          },
          tabs: <Widget>[
            Text('Jackets',style:TextStyle(color: tabBarIndex==0? Colors.black: Colors.white70,
            fontSize:tabBarIndex== 0 ? 16 : null,
            )),
            Text('Trousrs',style:TextStyle(color: tabBarIndex==1? Colors.black: Colors.white70,
            fontSize:tabBarIndex== 1 ? 16 : null,
            )),
            Text('T-shirts',style:TextStyle(color: tabBarIndex==2? Colors.black: Colors.white70,
            fontSize:tabBarIndex== 2 ? 16 : null,
            )),
            Text('Shoes',style:TextStyle(color: tabBarIndex==3? Colors.black: Colors.white70,
            fontSize:tabBarIndex== 3 ? 16 : null,
            ))
          ],
          ),
        ),
        body: TabBarView(
          children: <Widget>
          [
                                  jacketView(),
                                  trouserView(),
                                    Text('Test'),
                                    Text('Test'),
                        
                                  ]
                                  ),
                              ),
                              ),
                            Material(
                                      child: Padding(
                                    padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                                   child: Container(
                                     
                                     
                                height: MediaQuery.of(context).size.height * .1,
                                child: Row(
                                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                        Text('Discover'.toUpperCase(),
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, CartScreen.id);
                          },
                          child: Icon(Icons.shopping_cart))
                                ],
                                ),
                                
                                ),
                                      ),
                              )
                              ],
                              
                              
                              
                              
                              );
                              
                                
                              
                          }





                Widget jacketView() {
            
                return  StreamBuilder<QuerySnapshot>(
                    stream: store.loadProducts() ,
                    
                    // ignore: missing_return
                    builder:(context,snapshot)
                  {
                      if(snapshot.hasData){
                         List<Product>products=[];
                        for(var doc in snapshot.data.docs){
                var data=doc.data();
            
               
            
                products.add(Product(
                     pId: doc.id,
                      pName: data['Name'],
                      pPrice: data['Price'],
                      pDescription: data['Description'],
                      pCategory: data['Category'],
                      pLocation: data['Location']
                ));
                }
                
            
            _products = [...products];
            products.clear();
            products=getProductByCategory('jackets');
           
                   return GridView.builder(
                     gridDelegate: 
                     SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 1,
                       childAspectRatio: .8,
                       ),
            
                      itemBuilder: (context,index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal:10,vertical:10),
                        child: GestureDetector(

                          onTap: () {
                            Navigator.pushNamed(context, ProductInfo.id,arguments: products[index]);
                          },
                         
                        child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child:Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage(products[index].pLocation),
                                )
                                ),
                                Positioned(
                                  bottom:0,
                                  child:Opacity(opacity: .6,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    color: Colors.white70,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal:10,vertical:5),
                                                            child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(products[index].pName,style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text('\Price : ${products[index].pPrice}'),
            
                                        ],
                                      ),
                                    ),
                                  ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      )
                      
                    );
                        }
                    else {
                      return Center(child: Text('Loading...'));
                    }
                    
                    },
                  );
                  
                
            
            
                          }
            
            
            
            
            List<Product> getProductByCategory(String jackets) {
              
              List<Product>products = [];
              
                for (var product in _products)
              {
                if(product.pCategory=='jackets')
                {
                  products.add(product);
                }
                
                
            
              }
            
              return products;
            }
            
             Widget trouserView() {

               return  StreamBuilder<QuerySnapshot>(
                    stream: store.loadProducts() ,
                    
                    // ignore: missing_return
                    builder:(context,snapshot)
                  {
                      if(snapshot.hasData){
                         List<Product>products=[];
                        for(var doc in snapshot.data.docs){
                var data=doc.data();
            
               
            
                products.add(Product(
                     pId: doc.id,
                      pName: data['Name'],
                      pPrice: data['Price'],
                      pDescription: data['Description'],
                      pCategory: data['Category'],
                      pLocation: data['Location']
                ));
                }
                
            
            _products = [...products];
            products.clear();
            products=getProductCategory('trousers');
           
                   return GridView.builder(
                     gridDelegate: 
                     SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 1,
                       childAspectRatio: .8,
                       ),
            
                      itemBuilder: (context,index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal:10,vertical:10),
                        child: GestureDetector(
                         
                                      child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child:Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage(products[index].pLocation),
                                )
                                ),
                                Positioned(
                                  bottom:0,
                                  child:Opacity(opacity: .6,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    color: Colors.white70,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal:10,vertical:5),
                                                            child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(products[index].pName,style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text('\Price : ${products[index].pPrice}'),
            
                                        ],
                                      ),
                                    ),
                                  ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      )
                      
                    );
                        }
                    else {
                      return Center(child: Text('Loading...'));
                    }
                    
                    },
                  );
                  
                
            
            
                          }
            
            
            
            
            List<Product> getProductCategory(String trousers) {
              
              List<Product>products = [];
              
                for (var product in _products)
              {
                if(product.pCategory=='trousers')
                {
                  products.add(product);
                }
                
                
            
              }
            
              return products;
            }}