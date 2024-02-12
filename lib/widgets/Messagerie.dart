// ignore: file_names
import "package:flutter/material.dart";
import 'package:custom_clippers/custom_clippers.dart';
import 'package:message/models/Reclamation.dart';
import 'package:message/models/Reponse.dart';


class Messagerie extends StatefulWidget{
  const Messagerie({super.key, required this.reponse});

  final Reponse reponse;

  @override
  State<Messagerie> createState() => _MessagerieState();
}

class _MessagerieState extends State<Messagerie> {
  @override

  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Padding(
          padding:const EdgeInsets.only(right:80),
          child:ClipPath(
            clipper:UpperNipMessageClipper(MessageType.receive),
            child: Container(
              padding:const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color:const Color(0xffffffff),
                borderRadius:BorderRadius.circular(35),
                boxShadow:[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                   
                     blurRadius:10,
                     spreadRadius:2,
                     offset:const Offset(3,3),
                  ),
                ]
              ),
              child: Text(

                //Recupérer la description de la reclamation ici
                widget.reponse.message,
                style: const  TextStyle(
                  fontSize:16,
                  
                ),
              ),
            ),
          ),
        ),
        

        //La réponse
      Container(
        alignment: Alignment.centerRight,
        child:Padding(
          padding:const EdgeInsets.only(top:20, left:80),
          child:ClipPath(
            clipper:LowerNipMessageClipper(MessageType.send),
            child: Container(
              padding:const EdgeInsets.only(left:20, top: 10, bottom: 25, right:20),
              decoration: const BoxDecoration(
                color:Color(0xff005198),
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
              child:const Text(

                //La reponse liée à la reclamation
                "Hello, Programmer, i am fine, and you?",
                style: TextStyle(
                  fontSize:16,
                  color:Colors.white
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