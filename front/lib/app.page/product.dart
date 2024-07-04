import 'package:flutter/material.dart';
import 'package:front/app.page/form_comment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatefulWidget {
  final int productId;

  ProductPage({required this.productId});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Map<String, dynamic>? productData;

  @override
  void initState() {
    super.initState();
    fetchProductData();
  }

  Future<void> fetchProductData() async {
    final response = await http.get(Uri.parse('http://192.168.130.237:3000/products/${widget.productId}'));
    if (response.statusCode == 200) {
      setState(() {
        productData = json.decode(response.body);
      });
    } else {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        productData != null
            ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ID: ${productData!['id']}'),
              Text('Name: ${productData!['name']}'),
              Text('Description: ${productData!['description']}'),
              Text('Image: ${productData!['image']}'),
              Text('Rating: ${productData!['rating']}'),
              Text('Created At: ${productData!['createdAt']}'),
              Text('Updated At: ${productData!['updatedAt']}'),
              Text('Category ID: ${productData!['categoryId']}'),
            ],
          )
            : CircularProgressIndicator(),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommentForm(productId: productData!['id'],)),
            );
          },
          child: Text('Comment'),
        ),
          ],
        ),
      ),
    );
  }
}