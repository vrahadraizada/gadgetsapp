import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masterapp/modals/catalog.dart';
import 'package:masterapp/widgets/item_widget.dart';
import 'package:masterapp/widgets/theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeJson = jsonDecode(catalogJson);
    var productsData = decodeJson["products"];

    CatalogModel.items = List.from(productsData)
        .map<CatalogItem>((e) => CatalogItem.fromMap(e))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gadgets App',
          style: TextStyle(
            color: MyTheme.greyColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [Icon(Icons.lightbulb_outline)], //Icon(Icons.lightbulb)
      ),
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/cart'),
        child: Icon(Icons.shopping_cart, color: Colors.orange),
        backgroundColor: MyTheme.greyColor,
        hoverColor: Colors.black,
        mini: true,
      ),
      body: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
          ? ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: CatalogModel.items.length,
              itemBuilder: (context, index) {
                return ItemWidget(items: CatalogModel.items[index]);
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
