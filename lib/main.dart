import 'package:flutter/material.dart';
import 'agencies_page.dart';
import 'home_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set the primary color to blue
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Weather Page',
      style: TextStyle(color: Colors.blue), // Set the text color to blue
    ),
    Text(
      'Agencies Page',
      style: TextStyle(color: Colors.blue), // Set the text color to blue
    ),
    Text(
      'User Page',
      style: TextStyle(color: Colors.blue), // Set the text color to blue
    ),
  ];

  void _onItemTapped(int index) {
  if (index == 2) { // Index 2 corresponds to the "Agencies" icon
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AgenciesPage()),
    );
  }
    if (index == 0) {
    // Navigate to the Home Page
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HomePage(),
    ));
  }
  else {
    setState(() {
      _selectedIndex = index;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Navigation Bar'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue, // Set the selected icon color to blue
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blue, // Set the icon color to blue
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cloud,
              color: Colors.blue, // Set the icon color to blue
            ),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
              color: Colors.blue, // Set the icon color to blue
            ),
            label: 'Agencies',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.blue, // Set the icon color to blue
            ),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
