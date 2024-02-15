// import 'package:message/auth/api.dart';
import 'package:message/dashboard/pages/home/widgets/HomePage.dart';
import 'package:message/dashboard/admin.dart';
import 'package:flutter/material.dart';
import 'package:message/auth/login.dart';
import 'package:message/auth/sign.dart';
// import 'package:message/dashboard/dash.dart';
// import 'package:message/pages/Entete.dart';
import 'package:message/reclamation/reclamation_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
 var  isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
 var isAdmin = prefs.getBool('isAdmin') ?? false;

   runApp(MyApp(isLoggedIn: isLoggedIn, isAdmin: isAdmin));;
}

class MyApp extends StatelessWidget {

  final   bool isLoggedIn;
  final    bool isAdmin;
  const MyApp({super.key, required this.isLoggedIn, required this.isAdmin});
  @override
  Widget build(BuildContext context) {
    // if (isLoggedIn) {
    //   // Utilisateur connecté
    //   if (isAdmin) {
    //     // Rediriger vers le tableau de bord de l'administrateur
    //     return MaterialApp(home: MyAdmin());
    //   } else {
    //     // Rediriger vers le tableau de bord de l'utilisateur simple
    //     return MaterialApp(home:HomePage(listReclamations: [],));
    //   }
    // } else {
    //   // Utilisateur non connecté, afficher la page de connexion
    //   return MaterialApp(home: Login());
    // }
   
    return MaterialApp(
      title: 'e-Reclamation Coris CBI',
      debugShowCheckedModeBanner: false,
       initialRoute: 'login',
      // routes: {
      //   // "login":(context)=> const Login(),
      //  //"/":(context)=>MyApp(),
      //  "HomePage": (context) =>  HomePage(listReclamations: const []),
      // },
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
     
      "login":(context)=> const Login(),

       //"/":(context)=>MyApp(),
       "HomePage": (context) =>  HomePage(listReclamations: const []),
        "register":(context) =>const Signup(), 
         "reclamation":(context)=> const ReclamationClient(),
        // "chatPage":(context) =>const EnteteMessage(), 
        // "chatPage":(context) =>const ChatPage(), 
        "dashboard": (context) => MyAdmin(),
        

      },
    );
  }
}
