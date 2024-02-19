import "package:flutter/material.dart";
import "package:message/auth/api.dart";
import "package:message/models/Reclamation.dart";
import "package:message/pages/Entete.dart";


class RecentChats extends StatefulWidget{
   const RecentChats({super.key, required this.listReclamations});
  final List<Reclamation> listReclamations;
  


  @override
  State<RecentChats> createState() => _RecentChatsState();
}
final List<Reclamation> reclamation_client =[];

class _RecentChatsState extends State<RecentChats> {
  
// ignore: non_constant_identifier_names
// Future<void> User_reclamation() async{
//   try{
//       var dataClient= await Api().getDataWithOutData("list-client_reclamation");

    
//       // print("je suis là");
//       // print(dataClient);
//   }catch(e){

//   }
    

// }
  @override

  Widget build(BuildContext context){

    print(widget.listReclamations);
    return 
    SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child:  
        ListView.builder(
          itemCount: widget.listReclamations.length,
          itemBuilder: (BuildContext context, int  i){
          
              Reclamation reclamationEnCours = widget.listReclamations[i];

            return Padding(
              padding:const EdgeInsets.symmetric(vertical:15), 
              child:InkWell(
                onTap:(){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EnteteMessage(reclamation: reclamationEnCours)),
                    );
                },
              child:SizedBox(
                height:65,
                child:Row(
                  children:[
                    ClipRRect(
                      borderRadius:BorderRadius.circular(35),
                      child: Image.asset("images/avatar.png", height:65, width:65),
                    ),
                    Padding(
                      padding:const EdgeInsets.symmetric(horizontal:20),
                      child:Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children:[
                          
                          Text(
                            
                              // reclamationEnCours.description,
                            reclamationEnCours.objet.length > 10
                            ? '${reclamationEnCours.objet.substring(0, 10)}...'
                            : reclamationEnCours.objet,
                           // reclamationEnCours.objet, 
                            style:const TextStyle(
                              fontSize:18,
                              color:Color(0xff113953),
                              fontWeight:FontWeight.bold
                            ),
                          ),
                          const SizedBox(height:10),
                        
                            Text(
                            // reclamationEnCours.description,
                            reclamationEnCours.description.length > 15
                            ? '${reclamationEnCours.description.substring(0, 15)}...'
                            : reclamationEnCours.description,
                            style:const TextStyle(
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
                                color:const  Color.fromARGB(255, 16, 68, 102),
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
            );
        }
      )
     ) 
     );
    
    
    
    // SingleChildScrollView(
    //   physics: const ScrollPhysics(),
    //   // margin:const EdgeInsets.only(top:20, ),
    //   // padding:const EdgeInsets.symmetric(horizontal:10, vertical:25),
    //   // decoration: BoxDecoration(
    //   //   color:Colors.white,
    //   //   borderRadius:const BorderRadius.only(topLeft:Radius.circular(35),
    //   //   topRight:Radius.circular(35),
    //   //   ),
    //   //   boxShadow:[
    //   //     BoxShadow(
    //   //       color:Colors.grey.withOpacity(0.5),
    //   //       blurRadius:10,
    //   //       spreadRadius:2,
    //   //       offset:const Offset(0,2),
    //   //     ),
    //   //   ]),

    //     child : ListView.builder(
    //       itemCount: widget.listReclamations.length,
    //       itemBuilder: (BuildContext context, int  i){
          
    //           Reclamation reclamationEnCours = widget.listReclamations[i];

    //         return Padding(
    //           padding:const EdgeInsets.symmetric(vertical:15), 
    //           child:InkWell(
    //             onTap:(){
    //               Navigator.pushNamed(context, "chatPage");
    //             },
    //           child:Container(
    //             height:65,
    //             child:Row(
    //               children:[
    //                 ClipRRect(
    //                   borderRadius:BorderRadius.circular(35),
    //                   child: Image.asset("images/avatar.png", height:65, width:65),
    //                 ),
    //                 Padding(
    //                   padding:const EdgeInsets.symmetric(horizontal:20),
    //                   child:Column(
    //                     crossAxisAlignment:CrossAxisAlignment.start,
    //                     children:[

    //                       Text(reclamationEnCours.objet, 
    //                         style:const TextStyle(
    //                           fontSize:18,
    //                           color:Color(0xff113953),
    //                           fontWeight:FontWeight.bold
    //                         ),
    //                       ),
    //                       const SizedBox(height:10),
    //                       Text(
    //                         reclamationEnCours.description,
    //                         style:const TextStyle(
    //                           fontSize:16, 
    //                           color:Colors.black54,

    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 const Spacer(),
    //                 Padding(
    //                   padding:const EdgeInsets.only(right:10),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children:[
    //                       const Text(
    //                         "12:30",
    //                         style:TextStyle(
    //                           fontSize:15,
    //                           color:Colors.black54,
    //                           ),
    //                         ),
    //                         const SizedBox(
    //                           height:10,
    //                         ),
    //                         Container(
    //                           height:23,
    //                           width:23,
    //                           alignment:Alignment.center,
    //                           decoration:BoxDecoration(
    //                             color:const Color(0xff113953),
    //                             borderRadius:BorderRadius.circular(25),
    //                           ),
    //                           child: const Text(
    //                             "1", 
    //                             style:TextStyle(
    //                               color:Colors.white, 
    //                               fontSize:16, 
    //                               fontWeight: FontWeight.bold)
    //                             ),
    //                         ),
    //                      ]
    //                    ),
    //                 ),
    //                  ]
    //             ),
    //           ),
    //           ),
    //         );
    //     }) 
    //     // childr:Column(

    //     //   children:[
    //     //     for(int i=0; i<10;i++)
    //         // Padding(
    //         //   padding:const EdgeInsets.symmetric(vertical:15), 
    //         //   child:InkWell(
    //         //     onTap:(){
    //         //       Navigator.pushNamed(context, "chatPage");
    //         //     },
    //         //   child:Container(
    //         //     height:65,
    //         //     child:Row(
    //         //       children:[
    //         //         ClipRRect(
    //         //           borderRadius:BorderRadius.circular(35),
    //         //           child: Image.asset("images/avatar.png", height:65, width:65),
    //         //         ),
    //         //         const Padding(
    //         //           padding:EdgeInsets.symmetric(horizontal:20),
    //         //           child:Column(
    //         //             crossAxisAlignment:CrossAxisAlignment.start,
    //         //             children:[

    //         //               Text("Programmer", 
    //         //                 style:TextStyle(
    //         //                   fontSize:18,
    //         //                   color:Color(0xff113953),
    //         //                   fontWeight:FontWeight.bold
    //         //                 ),
    //         //               ),
    //         //               SizedBox(height:10),
    //         //               Text(
    //         //                 "Hello, how are you? ",
    //         //                 style:TextStyle(
    //         //                   fontSize:16, 
    //         //                   color:Colors.black54,

    //         //                 ),
    //         //               ),
    //         //             ],
    //         //           ),
    //         //         ),
    //         //         const Spacer(),
    //         //         Padding(
    //         //           padding:const EdgeInsets.only(right:10),
    //         //           child: Column(
    //         //             crossAxisAlignment: CrossAxisAlignment.center,
    //         //             children:[
    //         //               const Text(
    //         //                 "12:30",
    //         //                 style:TextStyle(
    //         //                   fontSize:15,
    //         //                   color:Colors.black54,
    //         //                   ),
    //         //                 ),
    //         //                 const SizedBox(
    //         //                   height:10,
    //         //                 ),
    //         //                 Container(
    //         //                   height:23,
    //         //                   width:23,
    //         //                   alignment:Alignment.center,
    //         //                   decoration:BoxDecoration(
    //         //                     color:const Color(0xff113953),
    //         //                     borderRadius:BorderRadius.circular(25),
    //         //                   ),
    //         //                   child: const Text(
    //         //                     "1", 
    //         //                     style:TextStyle(
    //         //                       color:Colors.white, 
    //         //                       fontSize:16, 
    //         //                       fontWeight: FontWeight.bold)
    //         //                     ),
    //         //                 ),
    //         //              ]
    //         //            ),
    //         //         ),
    //         //          ]
    //         //     ),
    //         //   ),
    //         //   ),
    //         // ),
    //       // ]
    //     // ),
    // );
  }
}