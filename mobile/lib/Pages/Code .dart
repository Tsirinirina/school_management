// void _login() {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Row(
//           children: [
//             Icon(
//               Icons.warning,
//               color: Colors.red, // Couleur de l'icône
//             ),
//             SizedBox(width: 8.0), // Espacement entre l'icône et le texte
//             Text(
//               'Erreur',
//               style: TextStyle(
//                 color: Colors.red, // Couleur du texte
//               ),
//             ),
//           ],
//         ),
//         content: Text('${message}'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Ferme la boîte de dialogue
//             },
//             child: Text('OK'),
//           ),
//         ],
//       );
//     },
//   );
// }

// void log2() {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Row(
//           children: [
//             Icon(
//               Icons.wifi_off_outlined,
//               color: Colors.red, // Couleur de l'icône
//             ),
//             SizedBox(width: 8.0), // Espacement entre l'icône et le texte
//             Text(
//               'Erreur de connexion',
//               style: TextStyle(
//                 color: Colors.red, // Couleur du texte
//               ),
//             ),
//           ],
//         ),
//         content: Text('Veuillez vous connecter a un réseau Wifi'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Ferme la boîte de dialogue
//             },
//             child: Text('OK'),
//           ),
//         ],
//       );
//     },
//   );
// }
