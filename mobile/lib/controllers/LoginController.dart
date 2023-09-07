import 'package:school_managemant_app/Pages/Home.dart';
import 'package:school_managemant_app/models/LoginReqModel.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  static Future<bool> login(LoginReqModel loginReqModel) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.wifi) {
      var username = loginReqModel.username;
      var password = loginReqModel.password;
      final response = await http.post(
        Uri.parse(
            'http://192.168.43.122:3000/api/login'), // Remplacez par l'URL de votre API
        body: {
          'username': username,
          'password': password,
        },
      );

      print('body: ${response.body}');
      if (response.statusCode == 200) {
        // Connexion réussie
        // Stockez les informations d'identification
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', "data");

        print('Connexion réussie: ${response.body}');
        return true;
      } else if (response.statusCode == 401) {
        // Identifiants incorrects

        final reponse = jsonDecode(response.body);
        final message = reponse["message"];
        print('message:${message}');
      } else {
        // Erreur inattendue
        print('Erreur: ${response.statusCode}');
      }
    } else if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return false;
  }
}
