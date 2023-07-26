import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Image(
                height: MediaQuery.of(context).size.height/2.5,
                width: double.infinity,
                image: const AssetImage('assets/images/login_background.jpg'),
                fit: BoxFit.cover,
              ),
              Text('FRENZY',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 34,
                fontWeight: FontWeight.bold,
                letterSpacing: 10.0,
                ),
              ),
              const SizedBox(height: 10,),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Username',
                  prefixIcon: Icon(
                    Icons.account_box,
                    size: 30,
                  ),
                ),
              ),
              ),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 30,
                    ),
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
