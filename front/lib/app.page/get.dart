import 'dart:convert';

import 'package:front/app.components/delete.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Get extends StatefulWidget {
  final String userId;

  const Get({super.key, required this.userId});

  @override
  State<Get> createState() => _GetState();
}

class _GetState extends State<Get> {
  late Future<dynamic> user;

  @override
    void initState() {
    super.initState();
    user = fetchUser(widget.userId);
  }

  Future<dynamic> fetchUser(String userId) async {
  final response = await http.get(Uri.parse('http://10.74.1.226:3000/users/$userId'));

  if (response.statusCode == 200) {
    // Le corps de la réponse est directement un objet utilisateur, donc pas besoin de [0] pour accéder au premier élément d'une liste
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load user');
  }
}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>( // Utilisez dynamic car nous attendons un objet et non une liste
      future: user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          // Les données sont maintenant directement accessibles car nous avons un objet et non une liste
          var userData = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text('${userData['firstname']} ${userData['lastname']}'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Email: ${userData['email']}', style: TextStyle(fontSize: 18)),
                  Text('Phone: ${userData['phone']}', style: TextStyle(fontSize: 18)),
                  // Utilisez join pour convertir la liste des rôles en String
                  Text('Role: ${userData['role'].join(", ")}', style: TextStyle(fontSize: 18)),
                  Text('Stockage Left: ${userData['stockageLeft']}', style: TextStyle(fontSize: 18)),
                  Text('Stockage Total: ${userData['stockageTotal']}', style: TextStyle(fontSize: 18)),
                  DeleteButton(userId: userData['_id'])
                ],
              ),
            ),
          );
        }
      },
    );
  }
}