
import 'package:flutter/material.dart';
import '../models/livre.dart';
import '../data/livres_data.dart';

class MaListeScreen extends StatefulWidget {
  const MaListeScreen({super.key});

  @override
  State<MaListeScreen> createState() => _MaListeScreenState();
}

class _MaListeScreenState extends State<MaListeScreen> {
  bool _nouveautesSeulement = false;
  final Map<String, bool> _genres = {
  'Roman': true,
  'Science': true,
  'Histoire': true,
  'Jeunesse': true,
  'Informatique': true,
};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma liste'),
      ),

body: Column(
  children: [
    CheckboxListTile(
      title: const Text(
        'Afficher uniquement les nouveautés',
      ),
      value: _nouveautesSeulement,
      onChanged: (value) {
        setState(() {
          _nouveautesSeulement = value ?? false;
        });
      },
    ),

    // Q3.3 et Q3.4 : afficher les genres de la Map.
    ..._genres.keys.map((genre) {
      final nombreLivres = livres
          .where((livre) => livre.genre == genre)
          .length;

      return CheckboxListTile(
        title: Text(genre),
        subtitle: Text('$nombreLivres livres'),
        secondary: Icon(_iconeGenre(genre)),
        value: _genres[genre],
        activeColor: Colors.deepPurple,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (value) {
          setState(() {
            _genres[genre] = value ?? false;
          });
        },
      );
    }),
  ],
),

    );
  }
  IconData _iconeGenre(String genre) {
  switch (genre) {
    case 'Roman':
      return Icons.menu_book;
    case 'Science':
      return Icons.science;
    case 'Histoire':
      return Icons.history_edu;
    case 'Jeunesse':
      return Icons.child_care;
    case 'Informatique':
      return Icons.computer;
    default:
      return Icons.book;
  }
}
}
