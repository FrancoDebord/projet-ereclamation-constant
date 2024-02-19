import 'package:flutter/material.dart';
import 'package:message/auth/api.dart';
import 'package:message/auth/login.dart';
import 'package:message/models/Reclamation.dart';
import 'package:message/models/Reponse.dart';
// import 'package:message/models/Reclamation.dart';
// import 'package:message/widgets/ActiveChats.dart';
import 'package:message/widgets/RecentChats.dart';
import "package:message/globals.dart" as globals;
import 'package:badges/badges.dart' as badges;

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  final List<Reclamation> listReclamations = [];
  final List<Reponse> listreponsesNonLues = [];

  int nombreReponsesNonLues = 0; //Le nombre de réponses non lues par le client
  bool afficherBadge = true; //savoir si on doit afficher le badge ou pas
  Color color = Colors.red;

  @override
  void initState() {
    super.initState();
    telechargerReclamationClient();
    telechargerReponsesNonLuesClient();
  }

  Future<void> telechargerReclamationClient() async {
    try {
      var reclamationClient = await Api().getDataWithOutData(
          "list-client_reclamation/${globals.user_connecte.id}");
      var listReclamationsObjet = reclamationClient.data;

      for (var reclamationJson in listReclamationsObjet) {
        setState(() {
          var reclamation = Reclamation.fromJson(reclamationJson);
          listReclamations.add(reclamation);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> telechargerReponsesNonLuesClient() async {
    try {
      var reponsesNonLuesClient = await Api().getDataWithOutData(
          "list-reponses-non-lues/${globals.user_connecte.id}");
      var listReponsesLues = reponsesNonLuesClient.data;

      for (var reponseJson in listReponsesLues) {
        setState(() {
          var reponseObjet = Reponse.fromJson(reponseJson);
          listreponsesNonLues.add(reponseObjet);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Widget badgeReponsesNonLues() {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 0, end: 3),
      badgeAnimation: const badges.BadgeAnimation.slide(
        disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
        curve: Curves.easeInCubic,
      ),
      showBadge: afficherBadge,
      badgeStyle: badges.BadgeStyle(
        badgeColor: color,
      ),
      badgeContent: Text(
        nombreReponsesNonLues.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      child:
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
    );
  }

  Future<dynamic> deconnection() async {
    var data = {
      "token": globals.access_token,
    };

    var logoutUser = await Api().postData(data, "logout");

    var body = logoutUser.data;

    print(body);

    return body;

    // if(body["status"]==1){

    //   //  ScaffoldMessenger.of(context).showSnackBar(
    //   // SnackBar(
    //   // content: const Text("Vous êtes déconnecté avec succès"),
    //   // duration: const Duration(seconds: 3), // Facultatif : Durée d'affichage du SnackBar
    //   // action: SnackBarAction(
    //   //   label: 'OK',
    //   //   onPressed: () {
    //   //       Navigator.push(
    //   //     context,
    //   //     MaterialPageRoute(builder: (context) => Login()),
    //   //   );
    //   //   },
    //   // ),));
    // }
  }

  @override
  Widget build(BuildContext context) {
    // afficherBadge  = nombreReponsesNonLues > 0;

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
          title: const Text("Liste des réclamations client"),
          leading: badges.Badge(
            position: badges.BadgePosition.topEnd(top: 10, end: 10),
            child: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                deconnection().then((data) {
                  if (data["status"] == "1") {

                  print("data je suis ici : $data");
                    Navigator.push(context, MaterialPageRoute(builder: ((context) =>  Login(messageOptionnel:data["message"]))));
                  }
                });
              },
            ),
          ),
          actions: [
            badgeReponsesNonLues(),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 15),
            //   child: Icon(Icons.notifications),
            // ),
          ]),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Text(
              "Messages",
              style: TextStyle(
                color: Color(0xff005198),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.search,
                    color: Color(0xff005198),
                  ),
                ],
              ),
            ),
          ),
          // const ActiveChats(),
          RecentChats(listReclamations: listReclamations),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff005198),
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "reclamation");
        },
      ),
    );
  }
}
