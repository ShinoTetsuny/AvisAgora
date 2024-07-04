import 'package:flutter/material.dart';
import 'package:front/app.page/product.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(productId: product['id']),
            ),
          );
        },
        child: Column(
          children: [
            Image.network(
              product['image'],
              fit: BoxFit.cover,
              width: 500,
              height: 100
            ), 
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                product['name'],
                style: GoogleFonts.firaSans(
                  textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(255, 185, 132, 140),
                  ),
                ),
                ),
                Text(
                'Note : ${product['rating'] ?? "Pas de Note"}',
                style: TextStyle(fontSize: 14),
                ),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}