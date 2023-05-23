import 'package:flutter/foundation.dart';
import 'package:provider_example/model/item.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> items = [
    Item(name: 'Popcorn', price: 10.0),
    Item(name: 'Ice Cream', price: 15.0),
    Item(name: 'Milk Shake', price: 20.0),
  ];

  List<Item> cart = [];

  void addToCart(Item item) {
    cart.add(item);
    notifyListeners();
  }
}
