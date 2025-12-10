import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Friends')),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search friends...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white10,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Mock friends
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text('Friend ${index + 1}', style: const TextStyle(color: Colors.white)),
                  subtitle: Text('Last seen: ${index + 1}h ago', style: const TextStyle(color: Colors.white70)),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Message'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}