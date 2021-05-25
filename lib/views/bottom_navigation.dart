import 'package:eticketing/views/chatlist_page.dart';
import 'package:eticketing/views/profil.dart';
import 'package:eticketing/views/dashboard.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = [
      // DashboardSamsat(),
      Dashboard(),
      ChatList(),
      Profil(),
    ];

    return Scaffold(
      body: Center(
        child: _listPage[_selectedNavbar],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: ('Dasbor'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: ('Pesan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: ('Profil'),
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
