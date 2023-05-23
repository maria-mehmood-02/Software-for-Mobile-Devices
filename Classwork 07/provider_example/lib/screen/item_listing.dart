import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/item_provider.dart';
import 'package:provider_example/screen/view_cart.dart';

class ItemListing extends StatelessWidget {
  const ItemListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item Listing'), actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ViewCart()),
            );
          },
        ),
      ]),
      body: Consumer<ItemProvider>(
        builder: (context, itemProvider, _) {
          return ListView.builder(
            itemCount: itemProvider.items.length,
            itemBuilder: (context, index) {
              final item = itemProvider.items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text('Rs. ${item.price}'),
                trailing: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    itemProvider.addToCart(item);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
