import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:front/app.page/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CarousselSection extends StatefulWidget {
  const CarousselSection({super.key});

  @override
  _CarousselSectionState createState() => _CarousselSectionState();
}

class _CarousselSectionState extends State<CarousselSection> {
  List<Map<String, dynamic>> productsList = [];

  @override
  void initState() {
    super.initState();
    fetchTopRatedProducts();
  }

  Future<void> fetchTopRatedProducts() async {
    final response = await http.get(Uri.parse('http://192.168.130.237:3000/products/top-rated'));
    if (response.statusCode == 200) {
      final List<dynamic> products = jsonDecode(response.body);
      setState(() {
        productsList = products.map((product) => product as Map<String, dynamic>).toList();
      });
    } else {
      throw Exception('Failed to fetch top rated products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: productsList.map((product) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(productId: product['id']),
            ),
          );
        },
         child: Container(
          child: Center(
            child: Image.network(product['image'] as String, fit: BoxFit.cover, width: 1000),
          ),
        ), 
      )).toList(),
    );
  }
}