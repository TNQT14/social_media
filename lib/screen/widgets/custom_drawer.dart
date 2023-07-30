import 'package:flutter/material.dart';
import 'package:social_media/screen/login_screen.dart';
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
          Stack(
            children: <Widget>
            [
              Image(
                  height: 200.0,
                  width: double.infinity,
                  image: AssetImage(
                    currentUser.backgroundImageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                          ),
                        ),
                    ),
                    const SizedBox(width: 6,),
                     Text(
                      currentUser.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
              ),
        ),
            ],
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
          child: Padding(padding: const EdgeInsets.only(bottom: 20.0),
          child: Align(
            alignment:  FractionalOffset.bottomCenter,
            child: _buidDrawerOption(
               const Icon(Icons.login),
               "Logout", () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_)=>const LoginScreen()))),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
