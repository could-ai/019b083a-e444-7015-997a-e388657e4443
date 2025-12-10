import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CrystalDream'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            onPressed: () {
              if (userProvider.isAdmin) {
                Navigator.pushNamed(context, '/admin');
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Global News Section
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.deepPurple.withOpacity(0.3),
            child: const Text(
              'Welcome to CrystalDream - Escape into AI Adventures!',
              style: TextStyle(fontSize: 18, color: Colors.cyanAccent),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildMenuButton(
                  context,
                  'Adventure',
                  Icons.explore,
                  () => Navigator.pushNamed(context, '/adventure'),
                ),
                _buildMenuButton(
                  context,
                  'Friends',
                  Icons.people,
                  () => Navigator.pushNamed(context, '/friends'),
                ),
                _buildMenuButton(
                  context,
                  'Messages',
                  Icons.message,
                  () => Navigator.pushNamed(context, '/messages'),
                ),
                _buildMenuButton(
                  context,
                  'Feed',
                  Icons.feed,
                  () {},
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Share app functionality
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Share functionality coming soon!')),
          );
        },
        child: const Icon(Icons.share),
        tooltip: 'Share the App',
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, IconData icon, VoidCallback onPressed) {
    return Card(
      color: Colors.white10,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, color: Colors.cyanAccent),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        onTap: onPressed,
      ),
    );
  }
}