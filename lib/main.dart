import 'dart:io';

import 'package:amazon_clone/Providers/user_provider.dart';
import 'package:amazon_clone/constans/global_variables.dart';
import 'package:amazon_clone/features/auth/screens/authscreen.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:http_proxy/http_proxy.dart';
import 'package:provider/provider.dart';

void main() {
 // Set up the proxy
  // HttpClient httpClient = HttpClient();
  // httpClient.findProxy = (uri) {
  //   // Replace 'localhost' and '3000' with your server's host and port
  //   return 'PROXY localhost:3000;';
  // };q
  // HttpOverrides.global = MyHttpOverrides(httpClient);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>UserProvider(),)
  ],
  child: const MyApp()));
}
class MyHttpOverrides extends HttpOverrides {
  final HttpClient httpClient;

  MyHttpOverrides(this.httpClient);

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return httpClient;
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
     scaffoldBackgroundColor: GlobalVariables.backgroundColor,
     
     appBarTheme: const AppBarTheme(elevation: 0,
     iconTheme: IconThemeData(color: Colors.black)),
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        useMaterial3: true,
      ),

      onGenerateRoute:(settings)=> generateRoute(settings),
      home: const AuthScreen(),
    );
  }
}






  
