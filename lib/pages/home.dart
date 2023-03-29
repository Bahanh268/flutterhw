import 'package:flutter/material.dart';
import 'package:flutterhw/pages/list_layout_page.dart';
import 'package:flutterhw/pages/assets_list_page.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Business',
      style: optionStyle,
    ),
    Text(
      'School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // backgroundColor: Colors.white70,
        // shadowColor: Colors.transparent,
        width: MediaQuery.of(context).size.width * 0.65,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurpleAccent),
              child: Text('Homework'),
            ),
            ListTile(
              title: const Text('C3'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ListLayoutPage(title: 'C3')));
              },
            ),
            ListTile(
              title: const Text('C4'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AssetsListPage()));
              },
            ),
            ListTile(
              title: const Text('C5'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Menu',
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: Alignment.center,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
