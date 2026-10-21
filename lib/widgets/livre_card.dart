
import 'package:flutter/material.dart';
import '../models/livre.dart';
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

Widget livreTile(Livre livre) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: livre.couleur,
      child: Text(
        livre.titre.isNotEmpty
            ? livre.titre[0].toUpperCase()
            : '?',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    title: Text(livre.titre),
    subtitle: Text('${livre.auteur} – ${livre.annee}'),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(livre.note.toString()),
        const SizedBox(width: 4),
        const Icon(Icons.star, color: Colors.amber),
      ],
    ),
  );
}
