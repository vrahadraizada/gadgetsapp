import 'package:masterapp/modals/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  CatalogModel _catalog;

  //Ids of each item
  final List<int> _itemIds = [];

  //Get Catalog
  CatalogModel get catalog => _catalog;

  //Set Catalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get items in the cart
  List<CatalogItem> get items =>
      _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get Total Price
  num get totalPrice => items.fold(0, (val, el) => val + el.price);

  //Add Item
  void addItem(CatalogItem item) => _itemIds.add(item.id);

  //Remove Item
  void removeItems(CatalogItem item) => _itemIds.remove(item.id);
}
