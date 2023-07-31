import 'package:flutter/material.dart';
import 'package:social_media/screen/widgets/custom_drawer.dart';

import '../models/user_model.dart';

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
    );
  }
}