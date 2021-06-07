import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.amber,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  'Super Man',
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: Text(
                  'superman@gmail.com',
                  style: TextStyle(color: Colors.grey[900]),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/superman.png'),
                  backgroundColor: Colors.grey[900],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.white),
              title: Text('Call Me'),
            ),
            ListTile(
              leading: Icon(Icons.message, color: Colors.white),
              title: Text('Email'),
            ),
          ],
        ),
      ),
    );
  }
}
