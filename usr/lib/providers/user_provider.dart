import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  bool _isAdmin = false; // Mock admin status

  bool get isAdmin => _isAdmin;

  void setAdmin(bool value) {
    _isAdmin = value;
    notifyListeners();
  }

  // Mock user data - replace with Supabase when connected
  Map<String, dynamic> get userData => {
    'email': 'user@example.com',
    'username': 'Player1',
    'stats': {
      'quests': 15,
      'missions': 23,
      'bosses': 8,
      'deaths': 5,
    },
  };
}