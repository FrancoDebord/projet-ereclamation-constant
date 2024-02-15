// ignore: file_names
import "package:flutter/material.dart";
import 'package:custom_clippers/custom_clippers.dart';
import 'package:message/models/Reclamation.dart';
// import 'package:message/models/Reclamation.dart';
import 'package:message/models/Reponse.dart';
import 'package:message/globals.dart' as globals;


class Messagerie extends StatefulWidget{
  const Messagerie({super.key, required this.reponse, required this.reclamation});

  final Reponse reponse;
  final Reclamation reclamation;

  @override
  State<Messagerie> createState() => _MessagerieState();
}

class _MessagerieState extends State<Messagerie> {
  @override

  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        // Padding(
        //   padding:const EdgeInsets.only(right:80),
        //   child:ClipPath(
        //     clipper:UpperNipMessageClipper(MessageType.receive),
        //     child: Container(
        //       padding:const EdgeInsets.all(20),
        //       decoration: BoxDecoration(
        //         color:const Color(0xffffffff),
        //         borderRadius:BorderRadius.circular(35),
        //         boxShadow:[
        //           BoxShadow(
        //             color: Colors.grey.withOpacity(0.5),
                   
        //              blurRadius:10,
        //              spreadRadius:2,
        //              offset:const Offset(3,3),
        //           ),
        //         ]
        //       ),
        //       child: const Text(

        //         //Recupérer la description de la reclamation ici
        //         // widget.reclamation.description,
        //         "",
        //         style: TextStyle(
        //           fontSize:16,
                  
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        

        //La réponse
      Container(
        alignment: Alignment.centerRight,
        child:Padding(
          padding:(globals.user_connecte.id == widget.reponse.clientId)?const EdgeInsets.only(top:20, left:80):const EdgeInsets.only(top:20, right:80),
          child:ClipPath(
            clipper:(globals.user_connecte.id == widget.reponse.clientId)?LowerNipMessageClipper(MessageType.send):LowerNipMessageClipper(MessageType.receive),
            child: Container(
              padding:const EdgeInsets.only(left:20, top: 10, bottom: 25, right:20),
              decoration:   BoxDecoration(
                color: (globals.user_connecte.id == widget.reponse.clientId)?const Color(0xff005198):const Color(0xffffffff).withOpacity(0.5),
                // boxShadow:[
                //   BoxShadow(
                //     color: Colors.grey.WithOpacity(0.5),
                //     borderRaduis:BorderRaduis.circular(35),
                //     blurRaduis:10,
                //     spreadRaduis:2,
                //     offset:Offset(0,3),
                //   ),
                // ]
              ),
              child: Text(

                //La reponse liée à la reclamation
                widget.reponse.message,
                style:  TextStyle(
                  fontSize:16,
                  color:(globals.user_connecte.id == widget.reponse.clientId)?Colors.white:Colors.black
                ),
              ),
            ),
          ),
        ),
        ),
      ],
    );
  }
}