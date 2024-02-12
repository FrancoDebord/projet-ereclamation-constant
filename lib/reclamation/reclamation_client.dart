
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:message/auth/api.dart';
import 'package:message/dashboard/pages/home/widgets/HomePage.dart';
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
  TextEditingController Objet_reclamationController = TextEditingController();
  TextEditingController descriptionController= TextEditingController();
  TextEditingController uidController= TextEditingController();


  Future<void> add_reclamation() async {

   
    try{
    final data={
      "objet":Objet_reclamationController .text.toString(),
      "description":descriptionController.text.toString(),
     // "client_id":uidController.text.toString(),
     
      
    };
     

      final response = await Api().postData(data, "creer-reclamation");

        print(response);
     
      final body = response.data;


       print( "La réclamation a été envoyée avec succès $body");

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
         Navigator.pushNamed(context, "HomePage");   
      }else{
          print("Erreur $body");
      }
   
    }catch(e){
      print(e);
    }

   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
    Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
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
                        'images/coris.png',  // Remplacez par le chemin de votre image
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
                controller: Objet_reclamationController,
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
                  
                  prefixIcon: Icon(Icons.warning, color: Colors.red)
                ),
              ),
            ),
            
           const SizedBox(height: 10,),
        Container(
        height: 50,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xff005198)),
          ),
          onPressed: () async {
                  showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                  child: CircularProgressIndicator(),
                    );
                  },
                );
            try{
              add_reclamation();
              Objet_reclamationController .text="";
              descriptionController.text="";

               await Future.delayed(Duration(seconds: 2)); // Attendez 2 secondes
    
                 Navigator.pop(context);
              
                        Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage(listReclamations: const [])),
                        );
  //  Navigator.pushNamed(context, "HomePage");
              
  } catch(e){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Erreur"),
          content: Text("Une erreur s'est produite lors de l'envoi de la réclamation."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Envoyer"),
            ),
          ],
        );
  },
    //               },
      // child:  Text(' Envoyer '),
    
  );
  }}, child: Text('Envoyer'),)
  ,
  )])));
  }
}