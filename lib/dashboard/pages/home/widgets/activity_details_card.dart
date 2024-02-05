// import 'package:dio/dio.dart';
// import 'package:message/auth/api.dart';
import 'package:message/auth/api.dart';
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


  @override
  void initState()   {
  
    super.initState();

    telechargerInfosReclamation();
  }

  Future<void> telechargerInfosReclamation() async {

     try{
       var responseCloturee = await Api().getDataWithOutData("list-reclamation-cloturees");
      //  var responseEnCours = await Api().getDataWithOutData("all-users");
    //  var reclamationsCloturees = responseCloturee.data;
    //  var reclamationsCloturees = List.from(responseCloturee.data['reclamations']);
      // var reclamationsEnCours = responseEnCours.data;
      // var reclamationsEnCours = List.from(responseEnCours.data["reclamations"]);

      
        // for (var i in reclamationsCloturees) {
        //   var reclamation = Reclamation.fromJson(i);
        //   listReclamationsCloturees.add(reclamation);
        // }

        // for (var i in reclamationsEnCours) {
        //   var reclamation = Reclamation.fromJson(i);
        //   listReclamationsEnCours.add(reclamation);
        // }

        print(listReclamationsCloturees);
        print(listReclamationsEnCours);
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

  final List<HealthModel> healthDetails = const [
    HealthModel(
        icon: 'assets/svg/burn.svg', value: "1000", title: "Nombre de clients"),
    HealthModel(icon: 'assets/svg/steps.svg', value: "30", title: "Plainte"),
    HealthModel(
        icon: 'assets/svg/distance.svg', value: "25", title: "Plaintes résolues"),
    HealthModel(icon: 'assets/svg/sleep.svg', value: "5", title: "Plaintes en cours"),
  ];

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      itemCount: healthDetails.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
          mainAxisSpacing: 12.0),
      itemBuilder: (context, i) {
        return CustomCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(healthDetails[i].icon),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 4),
                child: Text(
                  healthDetails[i].value,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                healthDetails[i].title,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        );
      },
   );
  }
}