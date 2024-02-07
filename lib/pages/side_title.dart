import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SibMenuTitle extends StatelessWidget{
  SibMenuTitle({super.key});
  @override
  
  Widget build(BuildContext context) {
    
    return Column( 
      children: [
         const Padding(
           padding: EdgeInsets.only(left: 24),
           child: Divider(
            color: Colors.white,
            height: 1,
            
                 ),
         ),
         ListTile(
            onTap: (){

            },
            leading: SizedBox(height: 34, width: 34,
            child: RiveAnimation.asset("assets/RiveAssets/icons.riv",
            artboard: "Home",
            onInit:(artboard){

            },),),
            
            title: const Text("Home", style:TextStyle(color: Colors.white70)  ,),
           )
      ],
    );
  }
}

