import "package:flutter/material.dart";
import 'package:message/auth/api.dart';
import 'package:message/models/Reclamation.dart';
import 'package:message/models/Reponse.dart';
import 'package:message/widgets/BasMessage.dart';
import 'package:message/widgets/Messagerie.dart';

class EnteteMessage extends StatefulWidget {
  const EnteteMessage({super.key, required this.reclamation});

  final Reclamation reclamation;

  @override
  State<EnteteMessage> createState() => _EnteteMessageState();
}

class _EnteteMessageState extends State<EnteteMessage> {
  List<Reponse> listReponsesReclamation = [];

  Future<void> getListReponsesReclamation() async {
    try {
      var listReponses = await Api().getDataWithDataInUrl(
          "list_message", widget.reclamation.id.toString());
      var listReponsesObjet = listReponses.data["data"];

      for (var i in listReponsesObjet) {
        setState(() {
          var reponse = Reponse.fromJson(i);
          listReponsesReclamation.add(reponse);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getListReponsesReclamation();

    //print("je passe par ici");
    print(listReponsesReclamation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   //For custom size of App Bar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: AppBar(
            backgroundColor: const Color(0xff005198),
            //color:Colors.white,
            leadingWidth: 30,
            title: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image.asset(
                  "images/avatar.png",
                  height: 45,
                  width: 45,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.reclamation.objet,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(10),
                        color: const Color(0xff005198), 
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2), 
                            spreadRadius: 2, 
                            blurRadius: 5, 
                            offset: const Offset(0,2),
                          ),
                        ],
                        
                        border: Border.all(
                          color:const Color(0xff005198), // Couleur de la bordure
                          width: 2, // Epaisseur de la bordure
                        ),
                      ),
                      child: Column(children: [
                      const  Text("Description de la réclamation", 
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color:Colors.white
                        ),
                      ),
                     const SizedBox(height: 10,),
                      Text(
                        widget.reclamation.description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                   ],) ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: listReponsesReclamation.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Messagerie(
                            reponse: listReponsesReclamation[index],
                            reclamation: widget.reclamation);
                      },
                    ),
                  )
                ],
              )
            ],
          )),
      bottomSheet: ChatBottom(
        reclamation: widget.reclamation,
      ),
    );
  }
}
