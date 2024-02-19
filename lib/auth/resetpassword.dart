import 'package:flutter/material.dart';
import 'package:message/auth/api.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  Future<void> resetpassword() async {
    setState(() {
      isLoading = true; // Activer le chargement
    });
    try {
      var data = {"email": emailController.text};

      var response = Api().postData(data, "forgetPassword");

      var body = response.data;

      if(body["status"]==1){
        print("Votre mot de passe a été changé avec succès");

        print(body);
      }else{
         ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      content: const Text("L'opération n'a pas marché, veuillez réssayer après"),
      duration: const Duration(seconds: 3), // Facultatif : Durée d'affichage du SnackBar
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
        //     Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ClientPage()),
        // );  
        },
      ),));
      }

      // Rediriger l'utilisateur vers la page de connexion
      Navigator.of(context).pop(); // Fermer la page actuelle
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur: ${e.toString()}'),
        ),
      );
    } finally {
      setState(() {
        isLoading = false; // Désactiver le chargement
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff005198),
        title: const Text('Changer votre mot de passe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              style: const TextStyle(
                fontSize: 12,
              ),
              decoration: const InputDecoration(
                labelText: 'Entrez votre e-mail',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                  resetpassword();
                  emailController.text="";
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                backgroundColor: const Color(0xFF005198),
              ),
              child: isLoading
                  ? CircularProgressIndicator() // Afficher le CircularProgressIndicator si isLoading est vrai
                  : const Text('Envoyer'),
            ),
          ],
        ),
      ),
    );
  }
}
