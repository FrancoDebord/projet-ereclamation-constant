// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:message/auth/api.dart';
import 'package:message/chatClient/HomeClient.dart';
// import 'package:message/dashboard/pages/home/widgets/HomePage.dart';

import 'package:message/globals.dart' as globals;
// import 'package:message/chatClient/pages/HomePage.dart';
// import 'package:message/dashboard/pages/home/page.dart';
// import 'package:message/auth/login.dart';
// import 'package:message/models/User.dart';
//import "dart:convert";

class ReclamationClient extends StatefulWidget {
  const ReclamationClient({super.key});

  @override
  State<ReclamationClient> createState() => _ReclamationState();
}

class _ReclamationState extends State<ReclamationClient> {
  TextEditingController objetReclamationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController uidController = TextEditingController();

  Future<void> addReclamation() async {
    try {
      final data = {
        "objet": objetReclamationController.text,
        "description": descriptionController.text,
        "client_id": globals.user_connecte.id.toString(),
      };

      final response = await Api().postData(data, "creer-reclamation");

      final body = response.data;

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("La réclamation a été envoyée avec succès"),
        duration: const Duration(
            seconds: 3), // Facultatif : Durée d'affichage du SnackBar
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ClientPage()),
            );
          },
        ),
      ));

   
   print("je viens ici pour erreur : $body");
      if (body['status'] == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ClientPage()),
        );
      } else {
        // ignore: avoid_print
        print("Erreur $body");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              // Container(
              //     alignment: Alignment.center,
              //     padding: const EdgeInsets.all(10),
              //     child: const Text(
              //       'Déposez votre plainte! ',
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 14),
              //     )),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue[900]!,
                          width: 2.0,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'images/coris.png', // Remplacez par le chemin de votre image
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: objetReclamationController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Entrer l\'objet de la demande ',
                    prefixIcon: Icon(Icons.email, color: Colors.red),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description de votre demande',
                      prefixIcon: Icon(Icons.warning, color: Colors.red)),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff005198)),
                  ),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    try {
                      addReclamation();
                      objetReclamationController.text = "";
                      descriptionController.text = "";

                      await Future.delayed(
                          const Duration(seconds: 2)); // Attendez 2 secondes

                      Navigator.pop(context);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClientPage()),
                      );
                      //  Navigator.pushNamed(context, "HomePage");
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Erreur"),
                            content: const Text(
                                "Une erreur s'est produite lors de l'envoi de la réclamation."),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Envoyer"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Envoyer'),
                ),
              )
            ])));
  }
}
