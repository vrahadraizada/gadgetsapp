import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool clickButton = false;
  final _formKey = GlobalKey<FormState>();

  isLogin(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() => clickButton = true);
      await Future.delayed(Duration(milliseconds: 1000));
      await Navigator.pushNamed(context, '/home');
      setState(() => clickButton = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/safe_login.png',
                fit: BoxFit.cover,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'W',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.grey[900],
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'elcome',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.amber,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter name...',
                          labelText: 'Username',
                        ),
                        validator: (value) {
                          if (value.isEmpty) return 'Username cannot be empty';
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter password...',
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password cannot be empty';
                          } else if (value.length < 8) {
                            return 'Password must be atleast 8 digits';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      Material(
                        color: Colors.amber,
                        borderRadius:
                            BorderRadius.circular(clickButton ? 50 : 10),
                        child: InkWell(
                          splashColor: Colors.white,
                          borderRadius:
                              BorderRadius.circular(clickButton ? 50 : 10),
                          onTap: () => isLogin(context),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 800),
                            height: 40,
                            width: clickButton ? 50 : 150,
                            alignment: Alignment.center,
                            child: clickButton
                                ? Icon(Icons.check)
                                : Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.grey[900],
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
