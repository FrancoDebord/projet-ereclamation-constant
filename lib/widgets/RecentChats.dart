// ignore: file_names
import "package:flutter/material.dart";
import "package:message/auth/api.dart";
import "package:message/models/Reclamation.dart";


class RecentChats extends StatefulWidget{
  const RecentChats({super.key});

  @override
  State<RecentChats> createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  List<Reclamation> reclamation_client =[];

Future<void> User_reclamation() async{
  try{
      List dataClient= await Api().getDataWithOutData("list-client_reclamation");

      // for (var i in dataClient) {
      //     var reclamationClient = Reclamation.fromJson(i);
      //     reclamationClient.add(reclamationClient );
      //   }

    

      print(dataClient);
  }catch(e){

  }
    

}
  @override

  Widget build(BuildContext context){
    return Container(
      margin:const EdgeInsets.only(top:20, ),
      padding:const EdgeInsets.symmetric(horizontal:10, vertical:25),
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius:const BorderRadius.only(topLeft:Radius.circular(35),
        topRight:Radius.circular(35),
        ),
        boxShadow:[
          BoxShadow(
            color:Colors.grey.withOpacity(0.5),
            blurRadius:10,
            spreadRadius:2,
            offset:const Offset(0,2),
          ),
        ]),
        child:Column(

          children:[
            for(int i=0; i<10;i++)
            Padding(
              padding:const EdgeInsets.symmetric(vertical:15), 
              child:InkWell(
                onTap:(){
                  Navigator.pushNamed(context, "chatPage");
                },
              child:Container(
                height:65,
                child:Row(
                  children:[
                    ClipRRect(
                      borderRadius:BorderRadius.circular(35),
                      child: Image.asset("images/avatar.png", height:65, width:65),
                    ),
                    const Padding(
                      padding:EdgeInsets.symmetric(horizontal:20),
                      child:Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children:[

                          Text("Programmer", 
                            style:TextStyle(
                              fontSize:18,
                              color:Color(0xff113953),
                              fontWeight:FontWeight.bold
                            ),
                          ),
                          SizedBox(height:10),
                          Text(
                            "Hello, how are you? ",
                            style:TextStyle(
                              fontSize:16, 
                              color:Colors.black54,

                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding:const EdgeInsets.only(right:10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          const Text(
                            "12:30",
                            style:TextStyle(
                              fontSize:15,
                              color:Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height:10,
                            ),
                            Container(
                              height:23,
                              width:23,
                              alignment:Alignment.center,
                              decoration:BoxDecoration(
                                color:const Color(0xff113953),
                                borderRadius:BorderRadius.circular(25),
                              ),
                              child: const Text(
                                "1", 
                                style:TextStyle(
                                  color:Colors.white, 
                                  fontSize:16, 
                                  fontWeight: FontWeight.bold)
                                ),
                            ),
                         ]
                       ),
                    ),
                     ]
                ),
              ),
              ),
            ),
          ]
        ),
    );
  }
}