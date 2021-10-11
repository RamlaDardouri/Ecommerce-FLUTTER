



import 'package:Ecommerce/provider/modelhud.dart';
import 'package:Ecommerce/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Ecommerce/services/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';



// ignore: must_be_immutable
class Signupscreen extends StatelessWidget {
  final GlobalKey<FormState> globalKey=GlobalKey<FormState>();
  static String id ='Signupscreen';
  String email, password ;
  final auth=Auth();
  
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
        backgroundColor: Colors.white70,
        body: ModalProgressHUD(
         inAsyncCall: Provider.of<ModelHud>(context).isLoading,
                child: Form(
            key:globalKey,
             child: ListView(
            children: <Widget>
            [
Container(
  padding: EdgeInsets.only(top:40),
  
  child: Column(
    
  children: <Widget>[
               
                //Image(
                  
                  //image: AssetImage('images/icons/buy.png'),width: 100 ,height: 100,
                  //),
                  //Positioned(
                   // bottom:0,
                    //child: Text(
                    //'Buy it',
                   // style:TextStyle(fontFamily:'Pacifico',
                    //fontSize: 25
                    //),
                  //),
                  //),
                  SizedBox(height:50),
                 Padding(padding: const EdgeInsets.symmetric(horizontal:20),
                  
                  child: TextFormField(
                    
                  validator:(value){
                   if(value.isEmpty)
                   {
                     return 'Name is empty';
                   }
                   return '';
  },              
                    
                     decoration: InputDecoration(
                       hintText: 'Enter your Username',
                       prefixIcon: Icon(
                         Icons.person,
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
                     return 'Email is empty';
                   }
                   return '';
  },              onChanged: (value){
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
                      builder:(context) =>FlatButton(
                      shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20) ),
                      onPressed: () async{

final modelhud=Provider.of<ModelHud>(context,listen: false);
modelhud.changeisLoading(true);

                      globalKey.currentState.validate();
                     globalKey.currentState.save();
                                    
                                     try{
              // ignore: unused_local_variable
              final authResult=await auth.signUp(email, password);
               modelhud.changeisLoading(false);
               Navigator.pushNamed(context, LoginScreen.id);
               
              //print(authResult.user.uid); 
                          
                 } 
                 on FirebaseAuthException catch(e) 
                 {
                   modelhud.changeisLoading(false);
                   Scaffold.of(context).showSnackBar((SnackBar(content: Text(e.message),
                     duration: new Duration(seconds:2),))
                   );
                  
              
                          
                 }  
                 modelhud.changeisLoading(false);    
                         },
                         color: Colors.black,
                         child: Text('SignUp',
                         style:TextStyle(
                           color: Colors.white
                         ))
                         
                         ),
                     ),
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text('Don have an account ? ',
                       style:TextStyle(color: Colors.white,
                       fontSize:12
                       ),
                       ),
                       GestureDetector(
                         onTap: () {
                           Navigator.pushNamed(context, LoginScreen.id);
                         },
                          child: Text('Login',
                         style: TextStyle(fontSize: 16),
                         ),
                       )
                     ]
                   )
                  
                  
  ],),
),

            ],
            
            ),
          ),
        )
          

        
    );
     
  
  }
}