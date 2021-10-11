



import 'package:Ecommerce/models/product.dart';
import 'package:Ecommerce/screens/edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:Ecommerce/services/store.dart';
class ManageProduct extends StatefulWidget {
  
  static String id='ManageProduct';

  @override
  _ManageProductState createState() => _ManageProductState();
}

class _ManageProductState extends State<ManageProduct> {
  
  final store =Store();
  
 
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white70,

      body: StreamBuilder<QuerySnapshot>(
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
    

       return GridView.builder(
         gridDelegate: 
         SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 1,
           childAspectRatio: .8,
           ),

          itemBuilder: (context,index) => Padding(
            padding: EdgeInsets.symmetric(horizontal:10,vertical:10),
            child: GestureDetector(
              onTapUp: (details) 
              {
                 double dx = details.globalPosition.dx;
                  double dy = details.globalPosition.dy;
                  double dxx=MediaQuery.of(context).size.width - dx;
                  double dyy=MediaQuery.of(context).size.width - dy;
              
              showMenu(
                context: context, 
              position: RelativeRect.fromLTRB(dx, dy ,dxx, dyy),
               items:[
                MyPopupMenuItem(
                  onClick: (){
                    Navigator.pushNamed(context, EditProduct.id,arguments: products[index]);
                  },
                  child: 
                  Text('Edit'),
                  
                  ),
                  MyPopupMenuItem(
                    onClick: (){
                    store.deleteProduct(products[index].pId);
                    },
                  child: 
                  Text('Delete'),
                  
                  ),
               ]
               ); 
               
              
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
      ),
      
    );
  }
}

class MyPopupMenuItem<T>extends PopupMenuItem<T>{
  final Widget child ;
  final Function onClick;

MyPopupMenuItem({@required this.child,@required this.onClick}): super (child: child);

@override
PopupMenuItemState<T,PopupMenuItem<T>>createState(){
  return MyPopupMenuItemState();
  }
  
  }
  
  class MyPopupMenuItemState<T,PopMenuItem>
  extends PopupMenuItemState<T,MyPopupMenuItem<T>> {
    @override 
    void handleTap(){
      widget.onClick();
      
    }
}