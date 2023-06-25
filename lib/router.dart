

import 'package:amazon_clone/features/auth/screens/authscreen.dart';
import 'package:flutter/material.dart';

import 'features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName : 
    return MaterialPageRoute( 
      settings: routeSettings,
      builder: (_){
      return AuthScreen();
    });
    case HomeScreen.routeName :
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_){
            return HomeScreen();
          });
    default :
     return MaterialPageRoute( 
      settings: routeSettings,
      builder: (_){
      return const Scaffold(body: Center(child: Text('This page does not exist')),);
    });
  }
}