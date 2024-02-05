// import 'package:message/auth/api.dart';
import 'package:message/dashboard/admin.dart';
import 'package:flutter/material.dart';
import 'package:message/auth/login.dart';
import 'package:message/auth/sign.dart';
// import 'package:message/dashboard/dash.dart';
import 'package:message/pages/ChatPage.dart';
import 'package:message/pages/HomePage.dart';
import 'package:message/reclamation/reclamation_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfff5f5f3),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffffffff),
          foregroundColor: Color(0xff005198),
        ),
      ),
      routes: {
        //"/": (context) =>const MyHomeAdmin(),

      "/":(context) =>const Login(),
      "reclamation":(context)=>  ReclamationClient(),
      "login":(context)=> const Login(),

       //"/":(context)=>MyApp(),
       "HomePage": (context) => const HomePage(),
        "register":(context) =>const Signup(), 
        "chatPage":(context) =>const ChatPage(), 
        "dashboard": (context) => MyAdmin(),
        

      },
    );
  }
}
