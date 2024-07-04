import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class CreateProductPage extends StatefulWidget {
  @override
  _CreateProductPageState createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  List<dynamic> categories = [];
  String name = '';
  String image = '';

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final response =
        await http.get(Uri.parse('http://192.168.130.237:3000/categorys'));
    if (response.statusCode == 200) {
      print(response.body);
      setState(() {
        categories = jsonDecode(response.body);
      });
    } else {
      // Handle error
    }
  }

  Future<void> createProduct() async {
    final response = await http.post(
      Uri.parse('http://192.168.130.237:3000/products'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'description': 'adqsqdaz',
        'categoryId': 3,
        'image': image,
      }),
    );
    if (response.statusCode == 201) {
      // Product created successfully
    } else {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
       appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 128, 100, 145),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'AVIS',
              style: GoogleFonts.firaSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8.0),
            CircleAvatar(
              radius: 20,
              child: Image.asset(
                'assets/images/loogoo.png',
                height: 30,
              ),
            ),
            SizedBox(width: 8.0),
            Text(
              'AGORA',
              style: GoogleFonts.firaSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
       
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.green),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateProductPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField(
              value: null,
              items: categories.map<DropdownMenuItem<dynamic>>((category) {
                return DropdownMenuItem<dynamic>(
                  value: category['id'],
                  child: Text(category['name']),
                );
              }).toList(),
              onChanged: (value) {
                // Handle category selection
              },
              decoration: InputDecoration(
                labelText: 'Categorie',
                labelStyle: GoogleFonts.firaSans(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 128, 100, 145),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 128, 100, 145),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Nom du produit',
                labelStyle: GoogleFonts.firaSans(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 128, 100, 145),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 128, 100, 145),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 128, 100, 145),
                  ),
                ),
              ),
              style: GoogleFonts.firaSans(
                textStyle: TextStyle(
                  color: Color.fromARGB(255, 128, 100, 145),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  image = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Image',
                labelStyle: GoogleFonts.firaSans(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 128, 100, 145),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 128, 100, 145),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 128, 100, 145),
                  ),
                ),
              ),
              style: GoogleFonts.firaSans(
                textStyle: TextStyle(
                  color: Color.fromARGB(255, 128, 100, 145),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: createProduct,
                child: Text(
                  'Create',
                  style: GoogleFonts.firaSans(
                    textStyle: TextStyle(color: Colors.white),),
                  
                ),
                
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromARGB(255, 47, 112, 175), // Updated color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
