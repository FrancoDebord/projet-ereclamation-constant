import "package:flutter/material.dart";
import "package:message/widgets/ChatBottomSheet.dart";
import "package:message/widgets/ChatSample.dart";

class ChatPage extends StatelessWidget{
  const ChatPage({super.key});

  @override

  Widget build(BuildContext context){
    return Scaffold(

      //For custom size of App Bar
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(70.0),
        child:Padding(
          padding:const EdgeInsets.only(top:5),
          child: AppBar(
            leadingWidth:30,
            title: Row(
              children:[
                ClipRRect(
                  borderRadius:BorderRadius.circular(35),
                  child:Image.asset(
                    "images/avatar.png",
                    height:45,
                    width:45,
                  ),
                ),
                const Padding(
                  padding:EdgeInsets.only(left:10),
                  child: Text(
                    "Programmer",
                    style:TextStyle(
                      fontSize:18, 
                      color: Color(0xff005198),
                    ),
                  ),
                ),
            ]),
            actions:const [
              Padding(
                padding:EdgeInsets.only(right:25),
                child:Icon(
                  Icons.call, 
                  color:Color(0xff005198)
                ),
              ),
              Padding(
                padding:EdgeInsets.only(right:25),
                child:Icon(
                  Icons.video_call, 
                  color:Color(0xff005198)
                ),
              ),
              Padding(
                padding:EdgeInsets.only(right:10),
                child:Icon(
                  Icons.more_vert, 
                  color:Color(0xff005198)
                ),
              ),
            ],
          ),
        ),
      ),
      body:ListView(
        padding:const EdgeInsets.only(
              top:20, 
              left:20, 
              right:20, 
              bottom:80
            ),
        children:const [
          ChatSample(),
         
        ],
      ),
      bottomSheet: const ChatBottomSheet(),
    );
  }
}