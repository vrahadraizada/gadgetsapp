import 'package:flutter/material.dart';
import 'package:masterapp/modals/catalog.dart';
import 'package:masterapp/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsScreen extends StatelessWidget {
  final CatalogItem items;

  const HomeDetailsScreen({Key key, @required this.items})
      : assert(items != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
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
            ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Buying not supported yet')),
              ),
              child: Text('Buy', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyTheme.greyColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: Key(items.id.toString()),
                child: Container(
                  padding: EdgeInsets.all(32),
                  child: Image.asset(items.image),
                ),
              ),
            ),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        items.name,
                        style: TextStyle(
                          color: MyTheme.greyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Text(items.desc),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
