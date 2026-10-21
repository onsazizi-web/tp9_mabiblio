
import 'package:flutter/material.dart';

class ParametresScreen extends StatelessWidget {
  const ParametresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Mon profil'),
            subtitle: const Text(
              'Nom, e-mail, mot de passe',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Profil sélectionné'),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: const Icon(Icons.chevron_right),
            tileColor: Colors.blue.shade50,
            iconColor: Colors.blue,
            textColor: Colors.blue.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          const ListTile(
            leading: Icon(Icons.language),
            title: Text('Langue'),
            subtitle: Text('Français'),
            trailing: Icon(Icons.chevron_right),
          ),

          // Q1.4 :
          // dense: true réduit la hauteur du ListTile.
          // isThreeLine: true augmente la hauteur pour trois lignes.
          // enabled: false désactive l'interaction et grise le contenu.
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('À propos'),
            subtitle: Text(
              'Version de l’application\nInformations générales',
            ),
            trailing: Icon(Icons.chevron_right),
            isThreeLine: true,
          ),
        ],
      ),
    );
  }
}
