import 'package:flutter/material.dart';
import 'package:front/app.page/product_list.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  final Map<String, dynamic> category;

  CategoryCard({required this.category});

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
              builder: (context) => ProductListPage(categoryId: category['id']),
            ),
          );
        },
        child: Center(
          child: Text(
            category['name'],
            style: GoogleFonts.firaSans(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(255, 	185,	132,	140),
                ),
              ),
          
          ),
        ),
      ),
    );
  }
}

