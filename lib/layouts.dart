import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/screens/fav.dart';
import 'package:furniture_app/screens/home.dart';
import 'package:furniture_app/screens/profile.dart';
import 'package:furniture_app/screens/search.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentIndex = 0;
  PageController pageCon= PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(controller: pageCon,children: [
        Home(),
        Search(),
        Fav(),
        Profile()
      ],
      onPageChanged: (value)=>setState(() {
   currentIndex= value;
      }),),
      //extendBody: true,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) => setState(() {
          currentIndex = value;
          pageCon.jumpToPage(value);
        }),
        selectedIndex: currentIndex,
        indicatorColor:  Theme.of(context).colorScheme.primary.withOpacity(0.2),
        backgroundColor:  Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
            selectedIcon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          NavigationDestination(icon: Icon(Icons.search), label: "Search",selectedIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.primary,
          ),),
          NavigationDestination(
              icon: Icon(Icons.favorite), label: "Favourites",selectedIcon: Icon(
            Icons.favorite,
            color: Theme.of(context).colorScheme.primary,
          ),),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile",selectedIcon: Icon(
            Icons.person,
            color: Theme.of(context).colorScheme.primary,
          ),),
        ],
      ),
    );
  }
}
