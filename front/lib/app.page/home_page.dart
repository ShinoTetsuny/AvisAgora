import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AvisAgora'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 128, 100, 145),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/menu.png'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/user.png'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchSection(),
            CarousselSection(),
            CategoriesSection(),
          ],
        ),
      ),
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Rechercher',
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.grey,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey[200],
                    size: 26,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CarousselSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://via.placeholder.com/600x400/8f8e94/FFFFFF?text=Slide+1',
      'https://via.placeholder.com/600x400/8e8e8f/FFFFFF?text=Slide+2',
      'https://via.placeholder.com/600x400/8e8e91/FFFFFF?text=Slide+3',
    ];

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
      items: imgList.map((item) => Container(
        child: Center(
          child: Image.network(item, fit: BoxFit.cover, width: 1000),
        ),
      )).toList(),
    );
  }
}
//categories section
class CategoriesSection extends StatelessWidget {
  final List categories = [
    'Films',
    'Séries',
    'Livres',
    'Bandes Dessinées',
    'Jeux Vidéos',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1.5,
      ),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: EdgeInsets.all(10),
          elevation: 5,
          child: InkWell(
            onTap: () {
              print('Catégorie sélectionnée: ${categories[index]}');
            },
            child: Center(
              child: Text(
                categories[index],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}