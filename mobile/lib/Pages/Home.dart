import 'package:flutter/material.dart';
import 'package:school_managemant_app/Pages/CardView.dart';
import 'package:school_managemant_app/Pages/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CardWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<void> clearSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs
      .clear(); // Cette ligne supprime toutes les données dans SharedPreferences
}

class _HomePageState extends State<HomePage> {
  final List<String> items = [
    "Carte 1",
    "Carte 2",
    "Carte 3",
    "Carte 4",
    "Carte 5",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.amber,
        width: 200,
        child: Column(
          children: <Widget>[
            Container(child: Text("Salut")),
          ],
        ),
      ),
      appBar: AppBar(
          title: Text(
            "Accueil",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons
                  .car_crash), // Icône de déconnexion (vous pouvez utiliser une autre icône de votre choix)
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardExamplesApp(),
                  ), // Remplacez LoginPage() par votre écran de connexion
                );
              },
            ),
            IconButton(
              icon: Icon(Icons
                  .logout), // Icône de déconnexion (vous pouvez utiliser une autre icône de votre choix)
              onPressed: () {
                clearSharedPreferences();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginPage()), // Remplacez LoginPage() par votre écran de connexion
                );
              },
            ),
          ],
          backgroundColor: Colors.amber),
      body: Center(
          child: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView(
            children: <Widget>[
              CardWidget(titre: "Card 1"),
              CardWidget(titre: "Card 2"),
              CardWidget(titre: "Card 3"),
              CardWidget(titre: "Card 4"),
            ],
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Nombre de colonnes dans la grille
            ),
          ),
        ),
      )),
    );
  }
}
