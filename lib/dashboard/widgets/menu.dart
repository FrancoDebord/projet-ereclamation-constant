import 'package:message/dashboard/model/menu_modal.dart';
import 'package:message/dashboard/responsive.dart';
import 'package:flutter/material.dart';
// import 'package:message/globals.dart' as globals;
import 'package:flutter_svg/svg.dart';

import '../../auth/api.dart';

class Menu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const Menu({super.key, required this.scaffoldKey});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  
  Future<void> logout() async {
    try{
   
      final response = await Api().getDataWithOutData("logout");

        print(response);
     
      final body = response.data;
       print( "Déconnexion effectuée $body");
      // if(body['status']==200){
      //     ScaffoldMessenger.of(context).showSnackBar(
      //         SnackBar(
      //         content: Text("Votre demande a été enregistrée avec succès"),
      //         duration: Duration(seconds: 3), // Facultatif : Durée d'affichage du SnackBar
      //         action: SnackBarAction(
      //           label: 'OK',
      //           onPressed: () {
      //             Navigator.pushNamed(context, "chatPage");   
      //     },
      //   ),)
      // );
      if(body['status']==1){
        print( "Déconnexion effectuée $body");
      }else{
          print("Erreur $body");
      }
   
    }catch(e){
      print(e);
    }

   }
  late List<MenuModel> menu;  
  

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    menu = [
    MenuModel(
      icon: 'assets/svg/home.svg',
      title: "Admin",
      onTap: () {
        Navigator.pushNamed(context, 'admin');
      },
    ),
    MenuModel(
      icon: 'assets/svg/profile.svg',
      title: "Profile",
      onTap: () {
        Navigator.pushNamed(context, 'profile');
      },
    ),
    
    MenuModel(
      icon: 'assets/svg/setting.svg',
      title: "Paramètres",
      onTap: () {
        Navigator.pushNamed(context, 'settings');
      },
    ),
    // MenuModel(
    //   icon: 'assets/svg/history.svg',
    //   title: "History",
    //   onTap: () {
    //     Navigator.pushNamed(context, 'history');
    //   },
    // ),
    MenuModel(
      icon: 'assets/svg/signout.svg',
      title: "Déconnexion", 
      onTap: () { 
       logout();
       },
    ),
  ];
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
          color: Color(0xFF171821)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: Responsive.isMobile(context) ? 40 : 80,
            ),
            for (var i = 0; i < menu.length; i++)
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                  color: selected == i
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selected = i;
                    });
                    widget.scaffoldKey.currentState!.closeDrawer();
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 7),
                        child: SvgPicture.asset(
                          menu[i].icon,
                          // ignore: deprecated_member_use
                          color: selected == i ? Colors.black : Colors.grey,
                        ),
                      ),
                      Text(
                        menu[i].title,
                        style: TextStyle(
                            fontSize: 16,
                            color: selected == i ? Colors.black : Colors.grey,
                            fontWeight: selected == i
                                ? FontWeight.w600
                                : FontWeight.normal),
                      )
                    ],
                  ),
                ),
              ),
          ],
        )),
      ),
    );
  }
}
