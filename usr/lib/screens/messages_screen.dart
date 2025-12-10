import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: ListView.builder(
        itemCount: 5, // Mock conversations
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text('User ${index + 1}', style: const TextStyle(color: Colors.white)),
            subtitle: Text('Last message...', style: const TextStyle(color: Colors.white70)),
            onTap: () {
              // Open chat
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // New message
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}