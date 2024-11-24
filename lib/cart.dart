import 'item.dart';
import 'product.dart';

class Cart {
  final Map<int, Item> _items = {};

  void addProduct(Product product) {
    final item = _items[product.id];
    if (item == null) {
      _items[product.id] = Item(product: product, quantity: 1);
    } else {
      _items[product.id] = Item(product: product, quantity: item.quantity + 1);
    }
  }

  bool get isEmpty => _items.isEmpty;

  double total() {
    return _items.values
        .map((item) => item.price)
        .reduce((value, element) => value + element);
  }

  @override
  String toString() {
    if (_items.isEmpty) {
      return 'Cart is empty';
    }
    final itemisedList =
        _items.values.map((item) => item.toString()).join('\n');
    return '------\n$itemisedList\nTotal: \$${total()}\n------';
  }
}
