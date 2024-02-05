// import 'package:message/dashboard/widgets/custom_card.dart';
// import 'package:flutter/material.dart';

// class WeightHeightBloodCard extends StatelessWidget {
//   const WeightHeightBloodCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return CustomCard(
//       color: const Color(0xFF2F353E),
//       child: Row(
//         //La statistique de la banque en terme de client( nombre de clients)
//         //Le nombre de client qui s'est plein
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           //Requete dans la table user dont typeUser="client"
//           details("Nombre de clients", "10000"),
//           //Requete dans les tables reclamations et user
//           details("Plainte", "3"),
//         ],
//       ),
//     );
//   }

//   Widget details(String key, String value) {
//     return Column(
//       children: [
//         Text(
//           key,
//           style: const TextStyle(
//             fontSize: 11,
//             color: Colors.grey,
//           ),
//         ),
//         const SizedBox(
//           height: 2,
//         ),
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 14,
//           ),
//         ),
//       ],
//     );
//   }
// }
