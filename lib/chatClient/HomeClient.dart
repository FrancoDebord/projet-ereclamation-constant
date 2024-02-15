import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:message/auth/api.dart';
import 'package:message/models/Reclamation.dart';
// import 'package:message/models/Reclamation.dart';
// import 'package:message/widgets/ActiveChats.dart';
import 'package:message/widgets/RecentChats.dart';
import "package:message/globals.dart" as globals;

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {


 final List<Reclamation> listReclamations=[];
  @override
 void initState()   {
    super.initState();
    telechargerReclamationClient();
}

Future<void> telechargerReclamationClient() async {
  try{


        // var reclamationClient = await Api().getDataWithDataInUrl("list-client_reclamation",globals.user_connecte.id.toString());
        var reclamationClient = await Api().getDataWithOutData("list-client_reclamation/${globals.user_connecte.id}");
         var listReclamationsObjet = reclamationClient.data;

          for (var reclamationJson in listReclamationsObjet) {

         setState(() {
           
            var reclamation = Reclamation.fromJson(reclamationJson);
            listReclamations.add(reclamation);
         });
        }

        
  }catch(e){
    print(e);
  }
}
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
          title: const Text("Liste des réclamations client"),
        actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Icon(Icons.notifications),
        ),

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
