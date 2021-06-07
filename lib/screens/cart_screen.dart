import 'package:flutter/material.dart';
import 'package:masterapp/modals/cart.dart';
import 'package:masterapp/widgets/theme.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(child: _CartList()),
            Divider(),
            _CartTotal(),
          ],
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$${_cart.totalPrice}',
            style: TextStyle(
              fontSize: 20,
              color: MyTheme.greyColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: 120,
            child: ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Buying not supported yet')),
              ),
              child: Text('Buy', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyTheme.greyColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
                overlayColor: MaterialStateProperty.all(Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? Center(child: Text('Cart is empty', style: TextStyle(fontSize: 18)))
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                hoverColor: MyTheme.creamColor,
                onPressed: () {
                  _cart.removeItems(_cart.items[index]);
                  setState(() {});
                },
              ),
              title: Text(_cart.items[index].name),
            ),
          );
  }
}
