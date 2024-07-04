import 'package:flutter/material.dart';
import 'package:front/app.page/create_product.dart';
import 'package:front/app.page/home_page.dart';
import 'package:front/app.page/login.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 128, 100, 145),
      centerTitle: true,
      title: GestureDetector(
        onTap: () {
          Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: Row(
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
      ),
      leading: IconButton(
          icon: Icon(Icons.add, color: Colors.green),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateProductPage()),
            );
          },
        ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
            },
            child: Image.asset('assets/images/user.png'),
          ),
        ),
      ],
    );
  }
}