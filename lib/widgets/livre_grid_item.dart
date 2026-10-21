
import 'package:flutter/material.dart';
import '../models/livre.dart';
import '../screens/detail_screen.dart';

class LivreGridItem extends StatelessWidget {
  final Livre livre;

  const LivreGridItem({
    super.key,
    required this.livre,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: livre.couleur,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.menu_book,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    livre.titre,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    livre.auteur,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          if (livre.favori)
            const Positioned(
              top: 8,
              right: 8,
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}
