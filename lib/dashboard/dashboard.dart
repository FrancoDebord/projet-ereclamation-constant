// import 'package:message/auth/api.dart';
// import 'package:message/dashboard/pages/home/page.dart';
import 'package:message/dashboard/pages/home/page.dart';
import 'package:message/dashboard/responsive.dart';
import 'package:message/dashboard/widgets/menu.dart';
import 'package:message/dashboard/widgets/profile/profile.dart';
import 'package:flutter/material.dart';


class DashBoard extends StatefulWidget {

  DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer:!Responsive.isDesktop(context) ? SizedBox(width: 250,
        child: Menu(scaffoldKey: _scaffoldKey)) :null,
        endDrawer:Responsive.isMobile(context) ? SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: const Profile()) : null,
        body: SafeArea(
          child: Row(
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 3,
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Menu(scaffoldKey: _scaffoldKey)),
                ),
              Expanded(flex: 8, child: HomePage(scaffoldKey: _scaffoldKey)),
              if (!Responsive.isMobile(context))
                const Expanded(
                  flex: 4,
                  child: Profile(),
                ),
            ],
          ),
        ));
  }
}
