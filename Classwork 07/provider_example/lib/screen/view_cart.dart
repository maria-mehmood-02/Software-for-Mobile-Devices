import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/item_provider.dart';

class ViewCart extends StatelessWidget {
  const ViewCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Consumer<ItemProvider>(
        builder: (context, itemProvider, _) {
          return ListView.builder(
            itemCount: itemProvider.cart.length,
            itemBuilder: (context, index) {
              final item = itemProvider.cart[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text('Rs. ${item.price}'),
              );
            },
          );
        },
      ),
    );
  }
}
