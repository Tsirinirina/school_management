import 'package:flutter/material.dart';
import 'package:school_managemant_app/Pages/Home.dart';
import 'package:school_managemant_app/Pages/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> checkLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    print('Username:${username}');
    return username != null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkLoggedIn(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Affichez un écran de chargement si nécessaire
          return CircularProgressIndicator();
        } else if (snapshot.hasData && snapshot.data == true) {
          // L'utilisateur est déjà connecté, dirigez-le vers la page d'accueil
          return MaterialApp(
            title: 'School Management App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HomePage(), // Remplacez par votre page d'accueil
          );
        } else {
          // L'utilisateur n'est pas encore connecté, affichez la page de connexion
          return MaterialApp(
            title: 'School Management App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const LoginPage(), // Remplacez par votre page de connexion
          );
        }
      },
    );
  }
}
