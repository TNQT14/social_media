import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  late PageController _pageController;
  late PageController _favoritesPageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController =
        PageController(initialPage: 0, viewportFraction: 0.8, keepPage: true);
    _favoritesPageController =
        PageController(initialPage: 0, viewportFraction: 0.8, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('FRENZY',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 34,
            fontWeight: FontWeight.bold,
            letterSpacing: 10.0,
          ),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          tabs: <Widget>[
            Tab(
              text: 'Trending',
              icon: Icon(Icons.trending_up),
            ),
            Tab(
              text: 'Latest',
              icon: Icon(Icons.local_fire_department),
            ),
          ],
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Container(),
    );
  }
}