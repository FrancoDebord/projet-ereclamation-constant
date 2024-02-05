import 'package:message/dashboard/model/scheduled_model.dart';
import 'package:message/dashboard/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Scheduled extends StatelessWidget {
  Scheduled({super.key});

//Récupérer les nouvelles réclamations depuis la base de données de l'API Laravel
  final List<ScheduledModel> scheduled = [
    ScheduledModel(title: "Fuite d'argent", date:"aujourd 12h", description: "Je vous prie...."),
    ScheduledModel(title: "Arnaque", date: "hier, 5h", description: "Mon compte a ete attaqué"),
    ScheduledModel(title: "Explication", date: "Wednesday, 9AM - 10AM", description: "Je veux le solde actuel de mon compte"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Nouveaux messages",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 12,
        ),
        for (var i = 0; i < scheduled.length; i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: CustomCard(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            scheduled[i].title,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            scheduled[i].date,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SvgPicture.asset('assets/svg/more.svg')
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
