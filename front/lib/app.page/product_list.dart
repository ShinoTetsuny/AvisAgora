import 'package:flutter/material.dart';
import 'package:front/app.components/block_product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
        title: Text('Product List'),
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