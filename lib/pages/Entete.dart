import "package:flutter/material.dart";
import 'package:message/auth/api.dart';
import 'package:message/models/Reclamation.dart';
import 'package:message/models/Reponse.dart';
import 'package:message/widgets/BasMessage.dart';
import 'package:message/widgets/Messagerie.dart';

class EnteteMessage extends StatefulWidget{
  const EnteteMessage({super.key,required this.reclamation});

   final Reclamation reclamation;

  @override
  State<EnteteMessage> createState() => _EnteteMessageState();
}

class _EnteteMessageState extends State<EnteteMessage> {

 List<Reponse> listReponsesReclamation=[];

  Future<void> getListReponsesReclamation() async{
  try{
       var listReponses = await Api().getDataWithDataInUrl("list_message",widget.reclamation.id.toString());
         var listReponsesObjet = listReponses.data["data"];

        //  print(listReponsesObjet);

          for (var i in listReponsesObjet) {

 print(i);
         setState(() {
           
            var reponse = Reponse.fromJson(i);
            listReponsesReclamation.add(reponse);
         });
        }

        
  }catch(e){
      print(e);
  }
    

}


@override
  void initState() {
    super.initState();
    getListReponsesReclamation();

print("je passe par ici");
    print(listReponsesReclamation);

  }
  @override

  Widget build(BuildContext context){

   
    return Scaffold(

    //   //For custom size of App Bar
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(70.0),
        child:Padding(
          padding:const EdgeInsets.only(top:5),
          child: AppBar(
            backgroundColor: const Color(0xff005198),
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
                 Padding(
                  padding:const EdgeInsets.only(left:10),
                  child: Text(
                    widget.reclamation.objet,
                    style:const TextStyle(
                      fontSize:18, 
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
            ]),
           
          ),
        ),
      ),
      body:
        SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          
          itemCount: listReponsesReclamation.length,
          itemBuilder: ( BuildContext context, int index){

      
            return Messagerie(reponse: listReponsesReclamation[index]);
          }, 
          
          ),
      ),
      // ListView(
      //   padding:const EdgeInsets.only(
      //         top:20, 
      //         left:20, 
      //         right:20, 
      //         bottom:80
      //       ),
      //   children:const [
      //     // Messagerie(),

      //     ListTile( title: Text("Bonsooir")),
      //     ListTile( title: Text("Bonjor")),
      //     ListTile( title: Text("exte")),

        
         
      //   ],
      // ),
      bottomSheet: const ChatBottom(),
    );
  }
}