import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/friends_screen.dart';
import 'screens/messages_screen.dart';
import 'screens/adventure_screen.dart';
import 'screens/admin_screen.dart';
import 'providers/user_provider.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const CrystalDreamApp(),
    ),
  );
}

class CrystalDreamApp extends StatelessWidget {
  const CrystalDreamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'CrystalDream',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.dark,
            ).copyWith(
              primary: Colors.deepPurple,
              secondary: Colors.pinkAccent,
              tertiary: Colors.cyanAccent,
              surface: Colors.black87,
              background: Colors.black,
              onPrimary: Colors.white,
              onSecondary: Colors.black,
              onSurface: Colors.white70,
              onBackground: Colors.white70,
            ),
            textTheme: const TextTheme(
              displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.cyanAccent),
              bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginScreen(),
            '/home': (context) => const HomeScreen(),
            '/profile': (context) => const ProfileScreen(),
            '/friends': (context) => const FriendsScreen(),
            '/messages': (context) => const MessagesScreen(),
            '/adventure': (context) => const AdventureScreen(),
            '/admin': (context) => const AdminScreen(),
          },
        );
      },
    );
  }
}