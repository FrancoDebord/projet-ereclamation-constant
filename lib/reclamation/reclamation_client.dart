
import 'package:flutter/material.dart';
import 'package:message/auth/api.dart';
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
      "client_id":uidController.text.toString(),
      
    };
     

      final response = await Api().postData(data, "creer-reclamation");
     
      final body = response.data;

       print( "La réclamation a été envoyée avec succès $body");

      if(body['status']==200){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
              content: Text("Votre demande a été enregistrée avec succès"),
              duration: Duration(seconds: 3), // Facultatif : Durée d'affichage du SnackBar
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {
                  Navigator.pushNamed(context, "chatPage");   
          },
        ),)
      );
         Navigator.pushNamed(context, "chatPage");   
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
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xff005198)?? Colors.blue),
          ),
          onPressed: () async {
            
              add_reclamation();
              Objet_reclamationController .text="";
              descriptionController.text="";
              
          },
    //               },
    child:  Text(' Envoyer '),
    
  ),
)
  ,
  ])));
  }
}