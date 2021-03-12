import 'package:eticketing/views/chatlist_page.dart';
import 'package:eticketing/views/profil_samsat.dart';
import 'package:eticketing/views/dashboardSamsat.dart';
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
      DashboardSamsat(),
      ChatList(),
      ProfilSamsat(),
    ];

    return Scaffold(
      body: Center(
        child: _listPage[_selectedNavbar],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: ('Dashboard'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: ('Chat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: ('Account'),
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
