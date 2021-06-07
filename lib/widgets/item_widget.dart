import 'package:flutter/material.dart';
import 'package:masterapp/modals/cart.dart';
import 'package:masterapp/modals/catalog.dart';
import 'package:masterapp/screens/home_details_screen.dart';
import 'package:masterapp/widgets/theme.dart';

class ItemWidget extends StatelessWidget {
  final CatalogItem items;

  const ItemWidget({Key key, @required this.items})
      : assert(items != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          leading: Container(
            color: MyTheme.creamColor,
            child: Hero(
              tag: Key(items.id.toString()),
              child: Image.asset(items.image),
            ),
            padding: EdgeInsets.all(5),
            width: 70,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                items.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyTheme.greyColor,
                  fontFamily: 'SansProLight',
                ),
              ),
              Text(
                items.desc,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                  fontFamily: 'SansProLight',
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${items.price}',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Buying not supported yet')),
                    ),
                    child: Text('Buy', style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.greyColor),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
                  ),
                  SizedBox(width: 5),
                  AddToCart(catalog: items),
                ],
              )
            ],
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailsScreen(items: items),
            ),
          ),
        ),
      ),
    );
  }
}

class AddToCart extends StatefulWidget {
  final CatalogItem catalog;

  const AddToCart({@required this.catalog});

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  bool isAdded = false;
  isToggle() => setState(() => isAdded = !isAdded);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isToggle();
        if (!_cart.items.contains(widget.catalog)) {
          if (isAdded) {
            final _catalog = CatalogModel();
            _cart.catalog = _catalog;
            _cart.addItem(widget.catalog);
          }
        }
      },
      child: Icon(
        isAdded ? Icons.check : Icons.shopping_cart,
        color: MyTheme.greyColor,
        size: 17,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.amber),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
    );
  }
}
