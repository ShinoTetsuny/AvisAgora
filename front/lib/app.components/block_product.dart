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
            /* Image.asset(
              product['image'],
              fit: BoxFit.cover,
            ), */
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    product['name'],
                    style: GoogleFonts.firaSans(textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 	185,	132,	140),
                    ),
                    ),
                  ),

                  /* SizedBox(height: 5), */
                  /* Text(
                    product['description'],
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 5), */
                  /* Text(
                    'Rating: ${product['rating']}',
                    style: TextStyle(fontSize: 14),
                  ), */
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}