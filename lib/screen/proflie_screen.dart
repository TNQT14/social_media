import 'package:flutter/material.dart';
import 'package:social_media/data/data.dart';
import 'package:social_media/screen/widgets/custom_drawer.dart';
import 'package:social_media/screen/widgets/profile_clipper.dart';

import '../models/user_model.dart';
import 'widgets/posts_carousel.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  const ProfileScreen({super.key, this.user = const User()});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _yourPostsPageController;
  late PageController _favoritesPageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _yourPostsPageController = PageController(initialPage:  0, viewportFraction: 0.8);
    _favoritesPageController = PageController(initialPage:  0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(      
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    width: double.infinity,
                    height: 300,
                    image: AssetImage(widget.user.backgroundImageUrl),
                    fit: BoxFit.cover,
                    ),
                ),
                Positioned(
                  top: 50,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    iconSize: 30,
                    color: Theme.of(context).primaryColor,
                    onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                  ),
                  ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0,2),
                          blurRadius: 10,
                        )
                      ]
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 100,
                        width: 100,
                        image: AssetImage(widget.user.profileImageUrl),
                        fit: BoxFit.cover,
                        ),
                    ),
                  ),
                ),      
              ],
            ),
            Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    widget.user.name,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      ),
                    ),
                  ), 
            PostsCarousel(
              pageController: _yourPostsPageController,
              title: 'Your Posts',
              posts: widget.user.posts,
            ),  
            PostsCarousel(
              pageController: _favoritesPageController,
              title: 'Your Favorites',
              posts: widget.user.posts,
            ), 
          ],
          ),
      )
    );
  }
}