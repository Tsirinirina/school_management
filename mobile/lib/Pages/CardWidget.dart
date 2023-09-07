import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.titre,
  });

  final String titre;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50.0,
            child: Stack(
              children: [
                Positioned(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text('${titre} Titre',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Color.fromARGB(255, 41, 41, 41))),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
