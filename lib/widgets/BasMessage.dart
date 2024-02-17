import "package:flutter/material.dart";
import "package:message/auth/api.dart";
import 'package:message/globals.dart' as globals;
import "package:message/models/Reclamation.dart";

import "package:intl/intl.dart";

class ChatBottom extends StatelessWidget{

  final Reclamation reclamation;
  ChatBottom({super.key, required this.reclamation});
final TextEditingController messageController = TextEditingController();
  
  
  
  Future<void> saveResponse() async {


    try{

      DateFormat dateFormat = DateFormat("yyyy-MM-dd");
      DateFormat heureFormat = DateFormat("HH:mm:ss");
      String dateMessage = dateFormat.format(DateTime.now());
      String heureMessage = heureFormat.format(DateTime.now());


    final data={
      "message":messageController.text,
      "reclamation_id": reclamation.id.toString(),
      "client_id":globals.user_connecte.id.toString(),
      "date_message":dateMessage,
      "heure_message":heureMessage,
      "lu_message":0
     
      
    };
      final response = await Api().postData(data, "creer-reponse");

        print(response);
     
      final body = response.data;


      //print( "Le message envoyé avec succès $body");

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
        print("message envoyé ${body["status"]}");

        messageController.text ="";
      }
   
    }catch(e){
      print(e);
    }

   }
  
  
  @override
Widget build(BuildContext context){
  return Container(
    height:65,
    decoration:BoxDecoration(
      color:Colors.white,
      boxShadow:[
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius:2,
          blurRadius:10,
          offset:const Offset(0,3),
        ),
      ],
    ),
    child:  
     Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        // const Padding(
        //   padding:EdgeInsets.only(left:10),
        //   child:Icon(
        //     Icons.add,
        //     color:Color(0xff005198),
        //     size:30,
        //   ),
        // ),

        // const Padding(
        //   padding:EdgeInsets.only(left:5),
        //   child:Icon(
        //     Icons.emoji_emotions_outlined,
        //     color:Color(0xff005198),
        //     size:30,
        //   ),
        // ),


        // Expanded(child: 
        // Padding(
        //   padding:const EdgeInsets.only(left:10),
        //   child:Container(
        //     // alignment: Alignment.centerRight,
        //     // width:MediaQuery.of(context).size.width,
        //     decoration: const BoxDecoration( 
        //       color : Colors.red
        //     ),
        //     child: TextFormField(
        //       controller: messageController,
        //       style: const TextStyle(color: Colors.black),
        //       decoration: InputDecoration(
        //         hintText: "Saisir votre réponse",
        //         hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
        //         border:InputBorder.none,
                
        //       ),
        //     ),
        //   ),
        // ),
        // ),

        Container(
          width: MediaQuery.of(context).size.width*.9,
          padding: const EdgeInsets.only(left: 10),
          child: TextFormField(
                controller: messageController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Saisir votre réponse",
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                  border:InputBorder.none,
                  
                ),
              ),
        ),
        GestureDetector(
          onTap:(){
            saveResponse();
            // String message = messageController.text;
            
          },
          child: const Padding(
          padding: EdgeInsets.only(right:5),
          child: Icon(
            Icons.send,
            color: Color(0xff005198),
            size:30
          ),
        ),
        ),
        const Spacer(),
        
      ],
    ),
  );
}
}