import 'package:flutter/material.dart';
import '../../data/data.dart';
import '../home_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  _buidDrawerOption(Icon icon, String title, VoidCallback onTap){
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Image(
                height: 200.0,
                width: double.infinity,
                image: AssetImage(
                  currentUser.backgroundImageUrl,
                ),
                fit: BoxFit.cover,
              ),
        _buidDrawerOption(
          const Icon(Icons.home),
          "Home",
          () => Navigator.pushReplacement(context,
           MaterialPageRoute(builder: (_) => const HomeScreen()))),
        _buidDrawerOption(const Icon(Icons.chat),"Chat", () {}),
        _buidDrawerOption(const Icon(Icons.location_on),"Map", () {}),
        _buidDrawerOption(const Icon(Icons.account_circle),"Your Profile", () {}),
        _buidDrawerOption(const Icon(Icons.settings),"Settings", () {}),
        Expanded(
          child: Padding(padding: EdgeInsets.only(bottom: 20.0),
          child: Align(
            alignment:  FractionalOffset.bottomCenter,
            child: _buidDrawerOption(
               const Icon(Icons.login),
               "Logout", () { }),
                ),
              ),
            ),
        Positioned(
          child: Row(
            children: <Widget>[
              Container(
                child: ClipOval(
                  child: Image(
                    image: AssetImage(currentUser.profileImageUrl),
                    fit: BoxFit.cover,
                    ),
                  ),
              ),
            ],
          ),
        ),
          ],
        ),
    );
  }
}
