// import 'package:message/dashboard/model/menu_modal.dart';
// import 'package:message/dashboard/responsive.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class DrawerClient extends StatefulWidget {
//   final GlobalKey<ScaffoldState> scaffoldKey;

//   const DrawerClient({super.key, required this.scaffoldKey});

//   @override
//   _DrawerClientState createState() => _DrawerClientState();
// }

// class _DrawerClientState extends State<DrawerClient> {
  
//   late List<MenuModel> menu;  
  // final List<MenuModel> menu = [
  //   MenuModel(
  //     icon: 'assets/svg/home.svg',
  //     title: "Admin",
  //     onTap: () {
  //       Navigator.pushNamed(context, 'admin');
  //     },
  //   ),
  //   MenuModel(
  //     icon: 'assets/svg/profile.svg',
  //     title: "Profile",
  //     onTap: () {
  //       Navigator.pushNamed(context, 'profile');
  //     },
  //   ),
  //   // MenuModel(
  //   //   icon: 'assets/svg/exercise.svg',
  //   //   title: "Exercise",
  //   //   onTap: () {
  //   //     Navigator.pushNamed(context, 'exercise');
  //   //   },
  //   // ),
  //   MenuModel(
  //     icon: 'assets/svg/setting.svg',
  //     title: "Settings",
  //     onTap: () {
  //       Navigator.pushNamed(context, 'settings');
  //     },
  //   ),
  //   MenuModel(
  //     icon: 'assets/svg/history.svg',
  //     title: "History",
  //     onTap: () {
  //       Navigator.pushNamed(context, 'history');
  //     },
  //   ),
  //   MenuModel(
  //     icon: 'assets/svg/signout.svg',
  //     title: "Signout",
  //   ),
  // ];

//   int selected = 0;

//   @override
//   Widget build(BuildContext context) {
//     menu = [
//     MenuModel(
//       icon: 'assets/svg/home.svg',
//       title: "Admin",
//       onTap: () {
//         Navigator.pushNamed(context, 'admin');
//       },
//     ),
//     MenuModel(
//       icon: 'assets/svg/profile.svg',
//       title: "Profile",
//       onTap: () {
//         Navigator.pushNamed(context, 'profile');
//       },
//     ),
    
//     MenuModel(
//       icon: 'assets/svg/setting.svg',
//       title: "Settings",
//       onTap: () {
//         Navigator.pushNamed(context, 'settings');
//       },
//     ),
//     MenuModel(
//       icon: 'assets/svg/history.svg',
//       title: "History",
//       onTap: () {
//         Navigator.pushNamed(context, 'history');
//       },
//     ),
//     MenuModel(
//       icon: 'assets/svg/signout.svg',
//       title: "Signout", 
//       onTap: () { 
//         Navigator.pushNamed(context, 'Déconnexion');
//        },
//     ),
//   ];
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       decoration: const BoxDecoration(
//           border: Border(
//             right: BorderSide(
//               color: Colors.white,
//               width: 1,
//             ),
//           ),
//           color: Color(0xFF171821)),
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: SingleChildScrollView(
//             child: Column(
//           children: [
//             SizedBox(
//               height: Responsive.isMobile(context) ? 40 : 80,
//             ),
//             for (var i = 0; i < menu.length; i++)
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 margin: const EdgeInsets.symmetric(vertical: 5),
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(6.0),
//                   ),
//                   color: selected == i
//                       ? Theme.of(context).primaryColor
//                       : Colors.transparent,
//                 ),
//                 child: InkWell(
//                   onTap: () {
//                     setState(() {
//                       selected = i;
//                     });
//                     widget.scaffoldKey.currentState!.closeDrawer();
//                   },
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 13, vertical: 7),
//                         child: SvgPicture.asset(
//                           menu[i].icon,
//                           // ignore: deprecated_member_use
//                           color: selected == i ? Colors.black : Colors.grey,
//                         ),
//                       ),
//                       Text(
//                         menu[i].title,
//                         style: TextStyle(
//                             fontSize: 16,
//                             color: selected == i ? Colors.black : Colors.grey,
//                             fontWeight: selected == i
//                                 ? FontWeight.w600
//                                 : FontWeight.normal),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//           ],
//         )),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message/pages/side_title.dart';
import 'package:rive/rive.dart';

import 'package:message/pages/info_card.dart';

class Menu_client extends StatefulWidget{
  Menu_client({super.key});

  @override
  State<Menu_client> createState() => _Menu_clientState();
}

class _Menu_clientState extends State<Menu_client> {
@override
Widget build(BuildContext context){
  return Scaffold(
    body:Container(
      width: 288,
      height: double.infinity,
      color : const Color(0xFF17203A),
      child:SafeArea(
        child: Column(
        children: [
        
           InfoCard(nom: 'Constant HOUEHA', profession: "Développeur",),
           Padding(
             padding: const EdgeInsets.only(left:24, top:32, bottom: 16 ),
             child: const Text("La navigation", style:
             TextStyle(color: Colors.white70),),
           ),
           SibMenuTitle(),

           //ici il y aura l'icon d'animation
           
        ],
      ),
    ),
  ),  
);
}
}

