import 'dart:convert';

import 'package:amazon_clone/Providers/user_provider.dart';
import 'package:amazon_clone/constans/error_handling.dart';
import 'package:amazon_clone/constans/global_variables.dart';
import 'package:amazon_clone/constans/utils.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthService{
  // signup user
   void signUpUser({
      required BuildContext context,
    required  String name,
    required  String email,
    required  String password,
   }  
   )async{
try{

User user = User(id: '', name: name, email: email, password: password, address: '', type: '', token: '');

 http.Response res =    await http.post(Uri.parse('$uri/api/signup'),body: user.toJson(),   headers: <String, String>{
        'Content-Type': 'application/json', // Set the Content-Type header
      },);

print(res.body);
httpErrorHandle(response: res, context: context, onSuccess: (){
  showSnackBar(context, 'Hurray Account Created');
   print('succesful');
});
}catch(e){
  print('error');
showSnackBar(context, e.toString());
}
    
   }



   void signInUser({
     required BuildContext context,
     required  String email,
     required  String password,
   }
       )async{
     try{



       http.Response res =    await http.post(Uri.parse('$uri/api/signin'),body: jsonEncode({"email": email,"password":password}),   headers: <String, String>{
         'Content-Type': 'application/json', // Set the Content-Type header
       },);

       print(res.body);
       httpErrorHandle(response: res, context: context, onSuccess: () async {

         // Obtain shared preferences.
         final SharedPreferences prefs = await SharedPreferences.getInstance();
         Provider.of<UserProvider>(context,listen: false).setUser(res.body);// res.body is a string
         await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
       });
     }catch(e){
       print('errorhere');
       showSnackBar(context, e.toString());
     }

   }
}