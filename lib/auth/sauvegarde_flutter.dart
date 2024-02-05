// import 'dart:async';
// //import 'dart:convert';
// // 

// Future<void> saveclient(
//     String email,
//     String nom,
//     String prenom,
//     String adresse,
//    String telehphone,
//     // String url,
//     // String? designation,
//     // String? departement
//     ) async {
//   try {
//     // Vérifier si Firebase est initialisé
//     if (Firebase.apps.length == 0) {
//       await Firebase.initializeApp();
//     }

//     // Accéder à la collection "formation" dans Firestore
//     CollectionReference client_collection =
//         FirebaseFirestore.instance.collection('client');

//     // Enregistrer les données dans un nouveau document
//     await client_collection.add({
//       'titre': email,
//       'description': nom,
//       'date_debut': prenom,
//       'date_fin': adresse,
//        'telephone': telehphone,
//       // 'url': url,
//       // 'designation': designation, // Stockez la valeur de la désignation
//       // 'departement': departement, // Stockez la valeur du département
//     });

//     print('Données de formation enregistrées avec succès');
//   } catch (e) {
//     print('Erreur lors de l\'enregistrement des données de formation : $e');
//   }
// }


// //Enregistrer les demandes des clients

// Future<void> plaintclient(
//     String uiduser,
//     String objet,
//     String description,
//     DateTime date_message ,
//    String codeclient,
//     // String url,
//     // String? designation,
//     // String? departement
//     ) async {
//   try {
//     // Vérifier si Firebase est initialisé
//     if (Firebase.apps.length == 0) {
//       await Firebase.initializeApp();
//     }

//     // Accéder à la collection "formation" dans Firestore
//     CollectionReference reclamation_collection =
//         FirebaseFirestore.instance.collection('reclamation');

//     // Enregistrer les données dans un nouveau document
//     // User? user = FirebaseAuth.instance.currentUser;
//     await reclamation_collection.add({
//       'uid_user': uiduser,
//       'objet': objet,
//       'description': description,
//       'date_message': date_message,
//       // 'url': url,
//       // 'designation': designation, // Stockez la valeur de la désignation
//       // 'departement': departement, // Stockez la valeur du département
//     });

//     print('Données de formation enregistrées avec succès');
//   } catch (e) {
//     print('Erreur lors de l\'enregistrement des données de formation : $e');
//   }
// }

