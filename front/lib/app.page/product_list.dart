import 'package:flutter/material.dart';
import 'package:front/app.components/block_product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class ProductListPage extends StatefulWidget {
  final int categoryId;

  ProductListPage({required this.categoryId});

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<dynamic> productList = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.130.237:3000/products/category/${widget.categoryId}'));
      if (response.statusCode == 200) {
        setState(() {
          productList = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      print(e);
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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Image.asset('assets/images/menu.png'), 
            
        ),
     ),
      body: ListView.builder(
        
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}