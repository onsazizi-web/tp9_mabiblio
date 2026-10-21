
import 'package:flutter/material.dart';
import '../models/livre.dart';
import '../data/livres_data.dart';

class MaListeScreen extends StatefulWidget {
  const MaListeScreen({super.key});

  @override
  State<MaListeScreen> createState() => _MaListeScreenState();
}

class _MaListeScreenState extends State<MaListeScreen> {
  // Q3.2 : filtre des nouveautés.
  bool _nouveautesSeulement = false;

  // Q3.3 : tous les genres sont cochés au départ.
  final Map<String, bool> _genres = {
    'Roman': true,
    'Science': true,
    'Histoire': true,
    'Jeunesse': true,
    'Informatique': true,
  };

  // Q3.6 : état de la case "Tous les genres".
  bool? get _tousGenresValue {
    if (_genres.values.every((value) => value)) {
      return true;
    }
    if (_genres.values.every((value) => !value)) {
      return false;
    }
    return null;
  }

  // Q3.4 : icône adaptée à chaque genre.
  IconData _iconeGenre(String genre) {
    switch (genre) {
      case 'Science':
        return Icons.science;
      case 'Informatique':
        return Icons.computer;
      case 'Histoire':
        return Icons.history_edu;
      case 'Jeunesse':
        return Icons.child_care;
      case 'Roman':
        return Icons.menu_book;
      default:
        return Icons.book;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Q3.7 : filtrer les livres selon les choix.
    final livresFiltres = livres.where((livre) {
      final genreCoche = _genres[livre.genre] ?? false;
      final nouveauteOK =
          !_nouveautesSeulement || livre.nouveaute;

      return genreCoche && nouveauteOK;
    }).toList();

    final nombreLus =
        livresFiltres.where((livre) => livre.lu).length;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lus : $nombreLus / ${livresFiltres.length}',
        ),
      ),

      body: Column(
        children: [
          // Q3.2 : filtre des nouveautés.
          CheckboxListTile(
            title: const Text(
              'Afficher uniquement les nouveautés',
            ),
            value: _nouveautesSeulement,
            activeColor: Colors.blue,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              setState(() { //Lorsque tu coches « Afficher uniquement les nouveautés », setState demande à Flutter de reconstruire l'interface avec la nouvelle valeur.
                _nouveautesSeulement = value ?? false;
              });
            },
          ),

          // Q3.6 : sélectionner ou désélectionner tous les genres.
          CheckboxListTile(
            title: const Text(
              'Tous les genres',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            tristate: true,
            value: _tousGenresValue,
            activeColor: Colors.blue,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              setState(() {
                // Si tous sont cochés, tout décocher.
                // Sinon, tout cocher.
                final cocherTous = _tousGenresValue != true;
                _genres.updateAll(
                  (genre, valeur) => cocherTous,
                );
              });
            },
          ),

          // Q3.3 à Q3.5 : cases générées depuis la Map.
          ..._genres.keys.map((genre) {
            final nombreLivres =
                livres.where((livre) => livre.genre == genre).length;

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

          const Divider(),

          // Q3.7 : liste des livres filtrés.
          Expanded(
            child: ListView.separated(
              itemCount: livresFiltres.length,
              separatorBuilder: (context, index) {
                return const Divider(indent: 72);
              },
              itemBuilder: (context, index) {
                final livre = livresFiltres[index];

                return CheckboxListTile(
                  value: livre.lu,
                  controlAffinity: ListTileControlAffinity.leading,
                  secondary: CircleAvatar(
                    backgroundColor: livre.couleur,
                    child: Text(
                      livre.titre.isNotEmpty
                          ? livre.titre[0].toUpperCase()
                          : '?',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    livre.titre,
                    style: TextStyle(
                      decoration: livre.lu
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(
                    '${livre.auteur} – ${livre.annee}',
                  ),
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      livre.lu = value ?? false;
                    });
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
