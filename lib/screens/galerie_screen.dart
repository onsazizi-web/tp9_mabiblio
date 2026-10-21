
import 'package:flutter/material.dart';
import '../models/livre.dart';
import '../data/livres_data.dart';
import '../widgets/livre_grid_item.dart';

class GalerieScreen extends StatelessWidget {
  const GalerieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final largeur = MediaQuery.of(context).size.width;

final nombreColonnes = largeur < 600
    ? 2
    : largeur < 900
        ? 3
        : 4;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galerie'),
      ),
      body: GridView.builder(
        itemCount: livres.length,
        padding: const EdgeInsets.all(12),
gridDelegate:
    SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: nombreColonnes,
  childAspectRatio: 0.7,
  mainAxisSpacing: 12,
  crossAxisSpacing: 12,
),

        itemBuilder: (context, index) {
          final livre = livres[index];
          return LivreGridItem(livre: livre);
        },
        
      ),
      
    );
  }
}



 
