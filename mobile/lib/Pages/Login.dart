import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:school_managemant_app/controllers/LoginController.dart';
import 'package:school_managemant_app/models/LoginReqModel.dart';
import 'package:school_managemant_app/models/LoginResModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> login(String username, String password) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.wifi) {
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
        await prefs.setString('username', username);

        print('Connexion réussie: ${response.body}');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else if (response.statusCode == 401) {
        // Identifiants incorrects

        final reponse = jsonDecode(response.body);
        final message = reponse["message"];
        print('message:${message}');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: Colors.red, // Couleur de l'icône
                  ),
                  SizedBox(width: 8.0), // Espacement entre l'icône et le texte
                  Text(
                    'Erreur',
                    style: TextStyle(
                      color: Colors.red, // Couleur du texte
                    ),
                  ),
                ],
              ),
              content: Text('${message}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Ferme la boîte de dialogue
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Erreur inattendue
        print('Erreur: ${response.statusCode}');
      }
    } else if (connectivityResult == ConnectivityResult.none) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                Icon(
                  Icons.wifi_off_outlined,
                  color: Colors.red, // Couleur de l'icône
                ),
                SizedBox(width: 8.0), // Espacement entre l'icône et le texte
                Text(
                  'Erreur de connexion',
                  style: TextStyle(
                    color: Colors.red, // Couleur du texte
                  ),
                ),
              ],
            ),
            content: Text('Veuillez vous connecter a un réseau Wifi'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Ferme la boîte de dialogue
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 192, 218, 239),
            Color.fromARGB(255, 153, 218, 242)
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            alignment: Alignment.bottomCenter,
            child: Center(
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "School",
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 28,
                          wordSpacing: -1,
                        ),
                      ),
                      TextSpan(
                        text: " Management",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 28,
                          wordSpacing: -1,
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          gapPadding: 4,
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            style: BorderStyle.solid,
                          ),
                        ),
                        labelText: "Nom d'utilisateur ou Email",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez entrer votre nom d'utilisateur";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                          ),
                        ),
                        labelText: "Mot de passe",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez entrer votre mot de passe";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40.0),
                    SizedBox(
                      width: 250.0,
                      height: 40.0,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // Tous les champs sont valides, effectuez votre logique de traitement ici
                            String username = usernameController.text;
                            String password = passwordController.text;
                            print("Nom d'utilisateur : $username");
                            print("Mot de passe : $password");
                            // await login(username, password);

                            LoginReqModel loginReqModel = LoginReqModel(
                              username: username,
                              password: password,
                            );

                            LoginController.login(loginReqModel)
                                .then((response) => {print(response)});
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          textStyle: TextStyle(color: Colors.white),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        child: const Text("Connexion"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
