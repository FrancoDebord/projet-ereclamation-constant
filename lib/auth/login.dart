// import 'dart:convert';

// import 'package:message/auth/api.dart';
// import 'package:message/auth/sign.dart';
import 'package:flutter/material.dart';
import 'package:message/auth/api.dart';
import 'package:message/models/User.dart';
//import "dart:convert";
import 'package:message/globals.dart' as globals;

import 'resetpassword.dart';
 
class Login extends StatefulWidget {
  const Login({super.key});
 
  @override
  State<Login> createState() => _LoginState();
}
 
class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override

// La méthode de l'api
  // _login() async {

  //   var data={
  //     "nom": emailController.text,
  //     "email": passwordController.text,
  //   };

  //   var res = await Api().postData(data, "login");
  //   var body = jsonDecode(res.body);

  //   if(body['status']){
  //     Navigator.push(
  //       context,
  //       new MaterialPageRoute(builder: (context)=>Scaffold(
  //         appBar: AppBar(

  //         ),
  //         body: Container(
  //           color: Colors.white,
  //         ),
  //       ))
  //     );
  //   }
    
  // }

  
  Widget build(BuildContext context) {
    return Scaffold(
      body:
    Padding(
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
        height: 150,
        width: 150,
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
                  labelText: 'Entrer votre adresse email ',
                  prefixIcon: Icon(Icons.email, color: Colors.red),
                    
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
            TextButton(
              onPressed: () {
                //forgot password screen
                 Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ResetPassword()),
      );
              },
              child: const Text('Mot de passe oublié?', style: TextStyle(color: Color(0xff005198)),),
            ),
   Container(
  height: 50,
  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
  child: ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[900]?? Colors.blue),
    ),
    onPressed: () async {
      try {
          
      var email = emailController.text.trim();
      var password = passwordController.text.trim();


       var data={
      "email": email,
      "password": password,
    };

      // final dio = Dio();
      // final response = await dio.post('http://10.0.2.2:8000/api/login',data : data);

    var response = await Api().postData(data, "login");
    var body = response.data;

    if(body["status"] == 1){

      User user = User.fromJson(body["user"]);

      
      globals.access_token = body["access_token"];

      //  ScaffoldMessenger.of(context).showSnackBar(
      // SnackBar(
      // content: Text("Connexion réussie avec succès"),
      // duration: Duration(seconds: 3), // Facultatif : Durée d'affichage du SnackBar
      // action: SnackBarAction(
      //   label: '',
      //   onPressed: () {
          
      //   },
      // ),));
      if(user.typeUser == "client"){
        Navigator.pushNamed(context, "HomePage");
      }else{
         Navigator.pushNamed(context, "HomePage");
        //  Navigator.pushNamed(context, "dashboard");
       // Navigator.pushNamed(context, "HomePage");
      }

    }else{

      print("Connexion échouée : ${body["message"]} ");
    }

      } catch (e) {
        
        print( e);
      }

    emailController.text="";
    passwordController.text="";
     
    },
    //               },
    child: const Text('Se connecter'),
  ),
)
  ,
 Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
        const Text('N\'avez-vous pas un compte?'),
                TextButton(
                  child: const Text(
                    'Créer un compte',
                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 22, 81, 129),
                  )),
                  onPressed: () {
                //     Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Signup()),
                //  );

                Navigator.pushNamed(context, "register");
                  },
                )
              ],
            ),
          ],
        )));
  }
}