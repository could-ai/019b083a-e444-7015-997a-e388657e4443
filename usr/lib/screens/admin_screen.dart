import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Panel')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Admin Tools', style: TextStyle(fontSize: 24, color: Colors.cyanAccent)),
          const SizedBox(height: 16),
          _buildAdminCard('User Management', 'View and edit all user profiles', Icons.people),
          _buildAdminCard('Global News', 'Create and manage global announcements', Icons.announcement),
          _buildAdminCard('App Settings', 'Configure global settings and themes', Icons.settings),
          _buildAdminCard('Event Tool', 'Create time-limited adventure events', Icons.event),
          _buildAdminCard('Trophy Management', 'Create and manage trophies', Icons.emoji_events),
          _buildAdminCard('Statistics Reset', 'Reset global user statistics', Icons.refresh),
        ],
      ),
    );
  }

  Widget _buildAdminCard(String title, String subtitle, IconData icon) {
    return Card(
      color: Colors.white10,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, color: Colors.cyanAccent),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
        onTap: () {
          // Navigate to specific admin tool
        },
      ),
    );
  }
}