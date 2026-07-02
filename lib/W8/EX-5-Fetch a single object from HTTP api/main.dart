import 'package:flutter/material.dart';
import 'ui/user_screen.dart';

void main(){

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserScreen(),
    )
  );

}


// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';


// void main() async {
//   Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');

//   // 1- Get the request response
//   Response response = await http.get(url);

//   print("test: ${response.body}");

//   // 2- Check the responsae status
//   if (response.statusCode != 200) {
//     throw Exception('Failed to fetch products (HTTP ${response.statusCode})');
//   }

//   // 3- Parse the response
//   Map<String, dynamic> json = jsonDecode(response.body);
//   User user = User.fromJson(json);
//   print("User: $user");

// }

// class User {

//   final String name;
//   final String email;
//   final String website;

//   const User({required this.name, required this.email, required this.website});

//   static User fromJson(Map<String, dynamic> json){

//     const String nameKey = "name";
//     const String emailKey = "email";
//     const String websiteKey = "website";

//     assert(json[nameKey] is String);
//     assert(json[emailKey] is String);
//     assert(json[websiteKey] is String);

//     String name = json[nameKey];
//     String email = json[emailKey];
//     String website = json[websiteKey]

//     return User(name: name, email: email, website: website);
//   }

//   @override
//   String toString() {
//     return "Name $name - Email= $email";
//   }

// }

// class Product {
//   final String title;
//   final double price;

//   Product({required this.title, required this.price});

//   static Product fromJson(Map<String, dynamic> json) {
//     const String titleKey = 'title';
//     const String priceKey = 'price';

//     assert(json[titleKey] is String);
//     assert(json[priceKey] is double);

//     String title = json[titleKey];
//     double price = json[priceKey];
 
//     return Product(title: title, price: price);
//   }

//   @override
//   String toString() {
//     return "Product $title - price= $price";
//   }
// }
