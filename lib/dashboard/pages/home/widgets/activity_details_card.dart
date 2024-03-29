// import 'package:dio/dio.dart';
// import 'package:message/auth/api.dart';
import 'package:message/auth/api.dart';
import 'package:message/dashboard/pages/home/widgets/HomePage.dart';
import 'package:message/dashboard/model/health_model.dart';
import 'package:message/dashboard/responsive.dart';
import 'package:message/dashboard/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:message/models/Reclamation.dart';
// import 'package:message/models/Reclamation.dart';

class ActivityDetailsCard extends StatefulWidget {
  const ActivityDetailsCard({super.key});

  @override
  State<ActivityDetailsCard> createState() => _ActivityDetailsCardState();
}

class _ActivityDetailsCardState extends State<ActivityDetailsCard> {

  List<Reclamation> listReclamationsCloturees=[];
  List<Reclamation> listReclamationsEnCours=[];

  int nombre_reclamations_en_cours=0;
  int nombre_reclamations_cloturees=0;


  @override
  void initState()   {
  
    super.initState();

    telechargerInfosReclamation();
  }

  Future<void> telechargerInfosReclamation() async {

     try{
       var responseCloturee = await Api().getDataWithOutData("list-reclamation-cloturees");
       var responseEnCours = await Api().getDataWithOutData("list-reclamation-en-cours");

     var reclamationsCloturees = responseCloturee.data;
    //  var reclamationsCloturees = List.from(responseCloturee.data['reclamations']);
      var reclamationsEnCours = responseEnCours.data;
      // var reclamationsEnCours = List.from(responseEnCours.data["reclamations"]);

      
        for (var i in reclamationsCloturees) {

          var reclamation = Reclamation.fromJson(i);
          listReclamationsCloturees.add(reclamation);
        }

        for (var i in reclamationsEnCours) {
          var reclamation = Reclamation.fromJson(i);
          listReclamationsEnCours.add(reclamation);
        }

        
        print(listReclamationsCloturees);

        print(listReclamationsEnCours);

      setState(() {
        
          nombre_reclamations_en_cours = listReclamationsEnCours.length;
        nombre_reclamations_cloturees = listReclamationsCloturees.length;
      });
      // } 
      // else {
      //   print("Erreur lors de la récupération des données.");
      // }


  //  final dio = Dio();
  //     final response = await dio.get('http://10.0.2.2:8000/api/all-users');

  //     print("$response");
    
  }catch(e){
    print("Erreur lors de la requête API : ${e.toString()}");
  }
 
  }
  @override
  Widget build(BuildContext context) {

  final List<HealthModel> statsReclamations =  [
    HealthModel(
        icon: 'assets/svg/burn.svg',
         value: nombre_reclamations_cloturees.toString(), 
         title: "Réclamations clôturées",
           
),
    HealthModel(
      icon: 'assets/svg/steps.svg',
      value: nombre_reclamations_en_cours.toString(), 
      title: "Réclamations en cours",
    
      ),
    
  ];

    return GridView.builder(
    itemCount: statsReclamations.length,
    shrinkWrap: true,
    physics: const ScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
      crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
      mainAxisSpacing: 12.0,
    ),
    itemBuilder: (context, i) {
      return InkWell(


        onTap :() {
            // Navigator.pushNamed(context, "HomePage");

        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  HomePage(listReclamations: (i == 0?listReclamationsCloturees:listReclamationsEnCours),)),
  );
        },
        child: CustomCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(statsReclamations[i].icon),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 4),
                child: Text(
                  statsReclamations[i].value,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                statsReclamations[i].title,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
       // onTap: stats_reclamations[i].onTap, // Définir l'action onTap ici
     );

    },
 );
  }
}
