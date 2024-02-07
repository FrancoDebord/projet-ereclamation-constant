import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget{
  final String nom, profession;
  InfoCard({super.key, required this.nom, required this.profession});
  
  @override  
  Widget build(BuildContext context){
    return ListTile( leading: const CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(CupertinoIcons.person, color: Colors.white,),
          ),
          title: Text(nom, style: const TextStyle(color: Colors.white),),
          subtitle: Text(
            profession,
           style: const TextStyle(color: Colors.white),
          ),
          );
  }
}