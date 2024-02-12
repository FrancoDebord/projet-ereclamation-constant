import 'package:message/auth/api.dart';
// import 'package:message/auth/login.dart';
// import 'package:message/auth/sauvegarde_flutter.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:message/models/User.dart';
 
class Signup extends StatefulWidget {
  const Signup({super.key});
 
  @override
  State<Signup> createState() => _SignupState();
}
 
class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   TextEditingController telephoneController = TextEditingController();

   Future<void> registerUser() async {

    try{
    final data={
      "email":emailController.text.toString(),
      "nom":nomController.text.toString(),
      "prenom":prenomController.text.toString(),
      "adresse":adresseController.text.toString(),
      "password":passwordController.text.toString(),
      "phone":telephoneController.text.toString(),
    };
      final response = await Api().postData(data, "register");
      final body = response.data;

      print( "$body");

      if(body['status']==200){
         Navigator.pushNamed(context, "login");   
      }

       ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      content: Text("Votre compte a été créé avec succès"),
      duration: Duration(seconds: 3), // Facultatif : Durée d'affichage du SnackBar
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          Navigator.pushNamed(context, "login");   
        },
      ),));
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      content: Text("Votre compte n'a pas été créé, $e"),
      duration: Duration(seconds: 3), // Facultatif : Durée d'affichage du SnackBar
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          Navigator.pushNamed(context, "register");   
        },
      ),));
    }

   }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body:  Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            // Container(
            //     alignment: Alignment.center,
            //     padding: const EdgeInsets.all(10),
            //     child: const Text(
            //       'TutorialKart',
            //       style: TextStyle(
            //           color: Colors.blue,
            //           fontWeight: FontWeight.w500,
            //           fontSize: 30),
            //     )),
            Container(
  alignment: Alignment.center,
  padding: const EdgeInsets.all(10),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        '',
        style: TextStyle(fontSize: 14),
      ),
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.blue[900]!,
            width: 2.0,
          ),
        ),
        child: ClipOval(
          child: Image.asset(
            'images/coris.png',  // Remplacez par le chemin de votre image
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  ),
),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email ',
                  prefixIcon: Icon(Icons.email, color: Colors.red),
                    
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nomController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Entrer votre nom ',
                  prefixIcon: Icon(Icons.verified_user_rounded, color: Colors.red),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: prenomController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'prenom ',
                  prefixIcon: Icon(Icons.supervised_user_circle_rounded, color: Colors.red),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: adresseController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'adresse ',
                  prefixIcon: Icon(Icons.maps_home_work_sharp, color: Colors.red),
                ),
              ),
            ),
             Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: telephoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Téléphone ',
                  prefixIcon: Icon(Icons.maps_home_work_sharp, color: Colors.red),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mot de passe',
                  
                  prefixIcon: Icon(Icons.password, color: Colors.red)
                ),
              ),
            ),
            // TextButton(
            //   onPressed: () {
            //     //forgot password screen
            //   },
            //   child: const Text('Mot de passe oublié?', style: TextStyle(),),
            // ),
            const SizedBox(height: 20 ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[900]?? Colors.blue),
    ),
                 
                  child: const Text('Créer un compte',),
                   
                  onPressed: () async {

                    // Navigator.push(
                    // context,
                    // MaterialPageRoute(builder: (context) =>  const Login()),
                    // );
                    registerUser();
                    emailController.text="";
                    nomController.text="";
                    prenomController.text="";
                    adresseController.text="";
                    passwordController.text="";
                    telephoneController.text="";
                  }
                                
              )
            ),
            Row(
              // ignore: sort_child_properties_last
              children: <Widget>[
                const Text('Avez-vous déjà un compte?'),
                
                TextButton(
                   child: const Text(
                    'se connecter',
                    style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 22, 81, 129),
                  )),
                  onPressed: () {
                    //signup screen
                      Navigator.pushNamed(context, "login");   
                   }
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        )));
  }
}