import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final VoidCallback toggleTheme;

  DashboardScreen({required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: toggleTheme,
          )
        ],
      ),
      body: Center(
        child: Text(
          'Bienvenido al Dashboard',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
