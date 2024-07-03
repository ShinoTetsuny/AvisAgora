import 'dart:convert';

import 'package:front/app.page/get.dart';
import 'package:front/app.page/register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rest API Call',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const _APIState(),
    );
  }
}

class _APIState extends StatefulWidget {
  const _APIState({super.key});
  
  @override
  State<_APIState> createState() => __APIStateState();
}

class __APIStateState extends State<_APIState> {
  late Future<List<dynamic>> futurePosts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Utilisateurs'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.green),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
      future: futurePosts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erreur: ${snapshot.error}'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var user = snapshot.data![index];
              return ListTile(
                title: Text('${user['firstname']} ${user['lastname']}'),
                onTap: () {
                  // Naviguer vers la page Get avec les détails de l'utilisateur
                  // Remplacer 'GetPage' par le nom de votre page de destination
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Get(userId: user['_id'])),
                  );
                },
              );
            },
          );
        }
      },
    ),
  );
}

  @override
  void initState() {
    super.initState();
    didChangeDependencies();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    futurePosts = fetchPosts(); // Déplacer l'appel ici
  }

  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse('http://10.74.1.226:3000/users'));

    if (response.statusCode == 200) {
      return json.decode(response.body);

      
    } else {
      throw Exception('Failed to load posts');
    }
  }
}