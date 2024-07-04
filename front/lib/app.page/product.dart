import 'package:flutter/material.dart';
import 'package:front/app.components/app_bar_all.dart';
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
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            productData != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${productData!['name']}'),
                      SizedBox(height: 5),
                      Image.network(
                        productData!['image'],
                        width: 200,
                        height: 400,
                      ),
                      SizedBox(height: 20),
                      Text('Rating: ${productData!['rating'] ?? "Pas encore Noté"}'),
                      SizedBox(height: 20),
                      Text('${productData!['description'] ?? "Pas de Description"}'),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentForm(
                                productId: productData!['id'],
                              ),
                            ),
                          );
                        },
                        child: Text('Avis'),
                      ),
                    ],
                  )
                : CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
