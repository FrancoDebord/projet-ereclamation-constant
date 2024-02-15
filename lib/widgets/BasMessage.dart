import "package:flutter/material.dart";
import "package:message/auth/api.dart";
import 'package:message/globals.dart' as globals;

class ChatBottom extends StatelessWidget{
  ChatBottom({super.key});
final TextEditingController messageController = TextEditingController();
  
  
  
  Future<void> saveResponse() async {
    try{
    final data={
      "message":messageController .text.toString(),
      // "reclamationId":descriptionController.text.toString(),
      "clientId":globals.user_connecte.id.toString(),
     
      
    };
      final response = await Api().postData(data, "creer-reponse");

        print(response);
     
      final body = response.data;


       print( "Le message envoyé avec succès $body");

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
        print("message envoyé ${body["staus"]}");
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
    child: Row(
      children : [
        const Padding(
          padding:EdgeInsets.only(left:10),
          child:Icon(
            Icons.add,
            color:Color(0xff005198),
            size:30,
          ),
        ),

        // const Padding(
        //   padding:EdgeInsets.only(left:5),
        //   child:Icon(
        //     Icons.emoji_emotions_outlined,
        //     color:Color(0xff005198),
        //     size:30,
        //   ),
        // ),
        Padding(
          padding:const EdgeInsets.only(left:10),
          child:Container(
            alignment: Alignment.centerRight,
            width:200,
            //MediaQuery.of(context).size.width,
           // 200,
            child: TextFormField(
              controller: messageController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Type something",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                border:InputBorder.none,
                
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap:(){
            saveResponse();
            // String message = messageController.text;
            messageController.text ="";
            
          },
          child: const Padding(
          padding: EdgeInsets.only(right:10),
          child: Icon(
            Icons.send,
            color: Color(0xff005198),
            size:16
          ),
        ),
        ),
        const Spacer(),
        
      ],
    ),
  );
}
}