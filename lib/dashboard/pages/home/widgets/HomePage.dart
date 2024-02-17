import 'package:flutter/material.dart';
import 'package:message/models/Reclamation.dart';
import 'package:message/reclamation/reclamation_client.dart';
// import 'package:message/widgets/ActiveChats.dart';
import 'package:message/widgets/RecentChats.dart';

// import '../../../../auth/login.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key, required this.listReclamations});
  final List<Reclamation> listReclamations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const Drawer(),
      appBar: AppBar(
          title: const Text("Liste des réclamations"),
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
               // color: Color(0xff005198),
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
                        decoration:  InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
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
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  ReclamationClient()),
           );
         // Navigator.pushNamed(context, "reclamation");
        },
      ),
    );
  }
}