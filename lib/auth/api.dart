import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import "package:dio/dio.dart";
// import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";
import 'package:message/globals.dart' as globals;

class Api{

 var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString("token")??"")['token'];
   
  }
  
  // final String _url= "http://127.0.0.1:8000/";
  final String _url= "http://10.0.2.2:8000/api/";
  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;

     final dio = Dio();
      return  await dio.post(fullUrl,data : data);
  }

/**
 * Methode à utiliser pour des routes GET qui ne demandent pas de paramètres
 */
   getDataWithOutData(apiUrl) async {
    var fullUrl = _url + apiUrl;

print("fullUrl : $fullUrl");
     final dio = Dio();
      return  await dio.get(fullUrl);
   
   
  }

/**
 * Methode à utiliser pour des routes GET qui demandent des paramètres
 */
  getDataWithData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;

     final dio = Dio();
      return  await dio.get(fullUrl,data : data);
   
   
  }
  // final String _url= "http://10.0.2.2:8000/api/";
  // postData(data, apiUrl) async {
  //   var fullUrl = _url + apiUrl;

  //   print(fullUrl);

  //   await _getToken();
  //    print("token : $token");

   
  //   return await http.post(
  //     Uri.parse(fullUrl),
  //     body:jsonEncode(data),
  //     headers: _setHeaders(),
  //   );
  // }
  _setHeaders()=>{
    'Content-type':'application/json',
    'Accept':'application/json',
     'Authorization': 'Bearer ${globals.access_token}',
  };

 
}