import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  void _resetPassword() async {
    setState(() {
      isLoading = true; // Activer le chargement
    });

    try {
      // await FirebaseAuth.instance.sendPasswordResetEmail(
      //   email: emailController.text.trim(),
      // );

      // Attendre deux secondes avant de désactiver le chargement
      await Future.delayed(const Duration(seconds: 2));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Un lien de réinitialisation de mot de passe a été envoyé à votre adresse e-mail.'),
        ),
      );

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
              onPressed: isLoading
                  ? null
                  : _resetPassword,
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
