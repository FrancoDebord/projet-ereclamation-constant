// import 'package:message/auth/api.dart';
import 'package:message/dashboard/const.dart';
import 'package:message/dashboard/dashboard.dart';
import 'package:flutter/material.dart';



class MyAdmin extends StatefulWidget {

   MyAdmin({super.key});

  @override
  State<MyAdmin> createState() => _MyAdminState();
}

class _MyAdminState extends State<MyAdmin> {
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Admin Ereclamation',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          primaryColor: MaterialColor(
            primaryColorCode,
            <int, Color>{
              50: const Color(primaryColorCode).withOpacity(0.1),
              100: const Color(primaryColorCode).withOpacity(0.2),
              200: const Color(primaryColorCode).withOpacity(0.3),
              300: const Color(primaryColorCode).withOpacity(0.4),
              400: const Color(primaryColorCode).withOpacity(0.5),
              500: const Color(primaryColorCode).withOpacity(0.6),
              600: const Color(primaryColorCode).withOpacity(0.7),
              700: const Color(primaryColorCode).withOpacity(0.8),
              800: const Color(primaryColorCode).withOpacity(0.9),
              900: const Color(primaryColorCode).withOpacity(1.0),
            },
          ),
          scaffoldBackgroundColor: Color(0xFFFFFFFF),
          fontFamily: 'IBMPlexSans',
          brightness: Brightness.dark),
      home: DashBoard(),
    );
  }
}
