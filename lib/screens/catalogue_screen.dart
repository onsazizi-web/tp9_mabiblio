
import 'package:flutter/material.dart';
import '../models/livre.dart';
import '../data/livres_data.dart';
import '../widgets/livre_card.dart';
import '../widgets/livre_grid_item.dart';
import 'detail_screen.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nouveautes =
        livres.where((livre) => livre.nouveaute == true).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogue'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Nouveautés',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Q2.7 : liste horizontale des nouveautés.
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: nouveautes.length,
              itemBuilder: (context, index) {
                final livre = nouveautes[index];

                return Container(
                  width: 110,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: livre.couleur,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    livre.titre,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Tout le catalogue',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Q2.4, Q2.5 et Q2.6 :
          // builder construit les lignes à mesure qu'elles sont nécessaires.
          // Pour 1 000 livres, il évite de créer tous les widgets à l'avance.

Expanded(
  child: ListView.builder(
    itemCount: livres.length,
    itemBuilder: (context, index) {
      final livre = livres[index];

      return LivreGrille(
        livre: livre,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(livre: livre),
            ),
          );
        },
      );
    },
  ),
),

        ],
      ),
    );
  }
}
