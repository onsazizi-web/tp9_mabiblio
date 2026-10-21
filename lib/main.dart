
import 'package:flutter/material.dart';
import 'models/livre.dart';
import 'widgets/livre_card.dart';
import 'screens/ma_liste_screen.dart';
import 'screens/catalogue_screen.dart';
import 'data/livres_data.dart';
import 'screens/galerie_screen.dart';

import 'screens/parametres_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaBiblio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
     home: const HomePage(),

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
  children: livres.take(3).map(livreTile).toList(),
),
     appBar: AppBar(
      
  title: const Text('MaBiblio'),
  actions: [
    
IconButton(
  icon: const Icon(Icons.grid_view),
  tooltip: 'Galerie',
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GalerieScreen(),
      ),
    );
  },
),

    IconButton(
  icon: const Icon(Icons.checklist),
  tooltip: 'Ma liste',
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MaListeScreen(),
      ),
    );
  },
),
    IconButton(

  icon: const Icon(Icons.menu_book),
  tooltip: 'Catalogue',
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CatalogueScreen(),
      ),
    );
  },
),
    IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ParametresScreen(),
            
          ),
        );
      },
    ),
  ],
),
     
    );
    
  }
  
}

