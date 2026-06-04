import 'package:flutter/material.dart';

enum Product {

  dart("Dart", "The best object language", "assets/ex3/dart.png"),
  flutter("Flutter", "The best mobile widget library", "assets/ex3/flutter.png"),
  firebase("Firebase", "The best cloud database", "assets/ex3/firebase.png");

  final String title;
  final String description;
  final String image;

  const Product(this.title, this.description, this.image);
}

class ProductCard extends StatelessWidget {

  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.image,
              width: 150,
              ),
            SizedBox(height: 10,),
            Text(
              product.title,
              style: TextStyle(
                fontSize: 48
              ),
            ),
            SizedBox(height: 10,),
            Text(
              product.description,
            )
          ],
        ),
      ),
    );
  }
}


void main(){

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Products"
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProductCard(product: Product.dart),
                ProductCard(product: Product.flutter),
                ProductCard(product: Product.firebase),
              ],
            ),
          ),
        ),
      )
    )
  );
}