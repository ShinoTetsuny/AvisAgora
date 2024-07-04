import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    final response = await http.get(Uri.parse('http://192.168.130.237:3000/categorys'));
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
        title: Text('Create Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
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
                labelText: 'Category',
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
                labelText: 'Name',
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
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: createProduct,
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}