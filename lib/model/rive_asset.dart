import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NavDrawer extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
 return Container(
      width: MediaQuery.of(context).size.width * 0.50,
      child: Drawer(
      child: Container(
      color: Color(0xff17243A),
      child: ListView(
      children: const <Widget>[
 ListTile(
        leading: const CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(CupertinoIcons.person, color: Colors.white,),
          ),
            title: Text("Client", style:  TextStyle(color: Colors.white),),
          //   subtitle: Text(
          //   "Client à Coris Bank Bénin",
          //  style: const TextStyle(color: Colors.white),
          // ),
          ),

SizedBox(height: 90,),
ListTile( leading: const CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(CupertinoIcons.home, color: Colors.white,),
          ),
          title: Text("Home", style: const TextStyle(color: Colors.white),),
          // subtitle: Text(
          //   "Client à Coris Bank Bénin",
          //  style: const TextStyle(color: Colors.white),
          // ),
          ),
  ListTile( leading: const CircleAvatar(
              backgroundColor: Colors.white24,
              
              child: Icon(Icons.logout, color: Colors.white,),
          ),
          title: Text("Déconencter", style: const TextStyle(color: Colors.white),
          ),
          ),

   Divider(),       
//  ListTile(
//    trailing: Icon(
//   Icons.home,
//   color: Colors.white,
//  ),
//  title: Text('Home'),
//  textColor: Colors.white,

//   // onTap: () => Navigator.of(context).push(MaterialPageRoute(
//   // builder: (context) => MyHomePage(title: "Home"))),
//  ),
 
//  ListTile(
//  title: Text('About'),
//  textColor: Colors.white,
//  trailing: Icon(
//  Icons.info_rounded,
//  color: Colors.white,
//  ),
// //  onTap: () => Navigator.of(context)
// //  .push(MaterialPageRoute(builder: (context) => About())),
//               ),
//         ListTile(
//  title: Text('Deconnexion'),
//  textColor: Colors.white,
//  trailing: Icon(
//  Icons.logout,
//  color: Colors.white,
//  ),
// //  onTap: () => Navigator.of(context)
// //  .push(MaterialPageRoute(builder: (context) => About())),
//               ),
            ],
          ),
        ),
      ),
    );
  }
}