import 'package:flutter/material.dart';
import 'package:food_app/controller/product_controller.dart';
import 'package:food_app/views/Homepage.dart';
import 'package:food_app/views/Nextpage.dart';
import 'package:food_app/views/cartpage.dart';
import 'package:food_app/views/detailpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductController>(
            create: (context) => ProductController()),
      ],
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const Homepage(),
            'Nextpage': (context) => const Nextpage(),
            'detailpage': (context) => const detailpage(),
            'cartpage':(context) => const cartpage(),
          },
        );
      },
    ),
  );
}

