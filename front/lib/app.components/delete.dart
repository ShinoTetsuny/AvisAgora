import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteButton extends StatelessWidget {
  final String userId;

  DeleteButton({required this.userId});

  Future<void> deleteUser(BuildContext context) async {
    final url = Uri.parse('http://10.74.1.226:3000/users/$userId');
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      // L'utilisateur a été supprimé avec succès
      print('Utilisateur supprimé');
      Navigator.pop(context); // Retour à l'écran précédent après la suppression
    } else {
      // Une erreur s'est produite lors de la suppression de l'utilisateur
      print('Erreur lors de la suppression de l\'utilisateur');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        deleteUser(context); // Passer le contexte à deleteUser
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
      ),
      child: Text(
        'DELETE',
      ),
    );
  }
}