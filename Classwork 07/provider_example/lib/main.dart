import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/item_provider.dart';
import 'screen/item_listing.dart';
import 'screen/view_cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: MaterialApp(
        title: 'Cart App',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (context) => const ItemListing(),
          '/cart': (context) => const ViewCart(),
        },
      ),
    );
  }
}
