import 'package:eticketing/chat_samsat.dart';
import 'package:eticketing/personal_chat.dart';
import 'package:eticketing/profil_samsat.dart';
import 'package:flutter/material.dart';

class Bottom_Navigation extends StatefulWidget {
  @override
  _Bottom_NavigationState createState() => _Bottom_NavigationState();
}

class _Bottom_NavigationState extends State<Bottom_Navigation> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = [
      Text("Dashboard"),
      // ChatSamsat(),
      ChatSamsat(),
      ProfilSamsat(),
    ];

    return Scaffold(
      body: Center(child: _listPage[_selectedNavbar]
          /* Text(
          "Tab Index yang aktif : $_selectedNavbar",
          style: TextStyle(fontSize: 16),
        ), */
          ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Dashboard'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Chat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Account'),
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Color(0xFFFFCE00),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
