



import 'package:Ecommerce/provider/admin.dart';
import 'package:Ecommerce/provider/modelhud.dart';
import 'package:Ecommerce/screens/Home.dart';
import 'package:Ecommerce/screens/adminPage.dart';
import 'package:Ecommerce/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Ecommerce/services/auth.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> globalKey=GlobalKey<FormState>();
  static String id='LoginScreen';
  String email,password;
  final auth=Auth();
  bool isAdmin =false;
  final adminPass='adminadmin';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Form(
        key:globalKey,
              child: ListView(
        children: <Widget>
        [
Container(
  padding: EdgeInsets.only(top:40),
  
  child: Column(
    
  children: <Widget>[
           
            Image(
              
              image: AssetImage('images/icons/buy.png'),width: 100 ,height: 100,
              ),
              Positioned(
                bottom:0,
                child: Text(
                'Buy it',
                style:TextStyle(fontFamily:'Pacifico',
                fontSize: 25
                ),
              ),
              ),
              SizedBox(height:25),
             Padding(padding: const EdgeInsets.symmetric(horizontal:20),
                          child: TextFormField(
                            validator:(value){
               if(value.isEmpty)
               {
                 return 'Email is empty';
               }
               return '';
  },
  onChanged: (value){
                    email=value.trim();
                 },
                 decoration: InputDecoration(
                   hintText: 'Enter your email',
                   prefixIcon: Icon(
                     Icons.email,
                     color: Colors.grey,
                     
                   ),
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

               ),
             ),
             SizedBox(height:25),
             Padding(padding: const EdgeInsets.symmetric(horizontal:20),
                          child: TextFormField(
                            validator:(value){
               if(value.isEmpty)
               {
                 return 'password is empty';
               }
               return '';
  },
         onChanged: (value){
                    password=value.trim();
                 },
                  obscureText: true,
                 decoration: InputDecoration(
                   hintText: 'Enter your password',
                   prefixIcon: Icon(
                     Icons.looks,
                     color: Colors.grey,
                     
                   ),
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

               ),) ,

               SizedBox(height:25),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal:120),
                 child: Builder(
                  builder:(context)=> FlatButton(
                     shape:RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20) ),
                     onPressed: () async {
                     validate(context);
                                          
                            },
                                          color: Colors.black,
                                          child: Text('Login',
                                          style:TextStyle(
                                            color: Colors.white
                                          ))
                                          
                                          ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Don\'t have an account ? ',
                                        style:TextStyle(color: Colors.white,
                                        fontSize:12
                                        ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(context, Signupscreen.id);
                                          },
                                           child: Text('SignUp',
                                          style: TextStyle(fontSize: 16),
                                          ),
                                        )
                                      ]
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal:30, vertical:10),
                                       child: Row(
                                        children:<Widget>[
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                               Provider.of<Admin>(context,listen: false).changeIsAdmin(true);
                                              },
                                              child: Text('I\'m an admin',
                                              textAlign:TextAlign.center,
                                              style: TextStyle(
                                                color:Provider.of<Admin>(context).isAdmin? Colors.grey : Colors.white
                                                ),),
                                            )),
                                           Expanded(
                                             child: GestureDetector(
                                               onTap: () {
                                                   Provider.of<Admin>(context,listen: false).changeIsAdmin(false);
                                               },
                                              child: Text('I\'m a user',
                                           textAlign:TextAlign.center,
                                           style: TextStyle(
                                                color: Provider.of<Admin>(context).isAdmin? Colors.white : Colors.grey
                                                ),),
                                             )),
                                           
                                        ]
                                      ),
                                    )
                                   
                                   
                       ],),
                     ),
                     
                             ],
                             
                             ),
                           )
                             
                     
                           
                         );
                       }
                     
  validate(BuildContext context) async
{
  final modelhud = Provider.of<ModelHud>(context,listen: false);
  modelhud.changeisLoading(true);
  globalKey.currentState.validate();
  
    globalKey.currentState.save();
      if(Provider.of<Admin> (context,listen: false).isAdmin)
      {

        if(password == adminPass)
        {
          try{
        await auth.signin(email, password);
        Navigator.pushNamed(context, AdminPage.id) ;
        }on FirebaseAuthException catch(e){
          modelhud.changeisLoading(false);
          Scaffold.of(context).showSnackBar(SnackBar(
            content:  Text(
              e.message
            ),

          ));
        }
            
        }else 
        {
          modelhud.changeisLoading(false);
           Scaffold.of(context).showSnackBar(SnackBar(
            content:  Text(
              'something went wrong'
            ),

          ));
         
        }

      }else 
      {
        try{
       await auth.signin(email, password);
        Navigator.pushNamed(context, Home.id) ;
        }on FirebaseAuthException catch(e){
          Scaffold.of(context).showSnackBar(SnackBar(
            content:  Text(
              e.message
            ),

          ));
        }
      }
  
  modelhud.changeisLoading(false) ;
}





}