
import 'package:flutter/material.dart';
import '../models/livre.dart';
import 'livre_card.dart';
import '../screens/detail_screen.dart';

class LivreGrille extends StatelessWidget {
  final Livre livre;
  final VoidCallback? onTap;

  const LivreGrille({
    super.key,
    required this.livre,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      shadowColor: Colors.black54,
      color: Colors.white,
      surfaceTintColor: Colors.blue.shade50,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
      onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailScreen(livre: livre),
    ),
  );
},
        child: livreTile(livre),
      ),
    );
  }
}
