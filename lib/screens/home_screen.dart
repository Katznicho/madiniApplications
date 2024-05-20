import 'package:flutter/material.dart';
import 'wallet_screen.dart';
import 'landing_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1; // Default selected index

  static const List<Widget> _pages = <Widget>[
    WalletScreen(),
    LandingScreen(),
    CartScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Madini',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Define what happens when you tap on the user icon
              print('User icon tapped');
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Define what happens when you tap on the cart icon
              print('Shopping cart tapped');
            },
          )
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/images/wallet.jpg'),
              width: 30, // Set your desired width
              height: 30, // Set your desired height
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/images/madini_icon.jpg'),
              width: 30, // Set your desired width
              height: 30, // Set your desired height
            ),
            label: '',
          ),BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/images/cart_icon.jpg'),
              width: 30, // Set your desired width
              height: 30, // Set your desired height
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red, // Set the primary color to red
        onTap: _onItemTapped,
      ),
    );
  }
}
