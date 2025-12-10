import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;
  File? _coverImage;
  final _picker = ImagePicker();

  Future<void> _pickImage(bool isProfile) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isProfile) {
          _profileImage = File(pickedFile.path);
        } else {
          _coverImage = File(pickedFile.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cover Image
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.deepPurple,
              child: _coverImage != null
                  ? Image.file(_coverImage!, fit: BoxFit.cover)
                  : const Center(child: Text('Cover Image', style: TextStyle(color: Colors.white))),
            ),
            // Profile Image
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                  child: _profileImage == null ? const Icon(Icons.person, size: 50) : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () => _pickImage(true),
                    icon: const Icon(Icons.camera_alt),
                    style: IconButton.styleFrom(backgroundColor: Colors.cyanAccent),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Username', style: TextStyle(fontSize: 24, color: Colors.white)),
            ElevatedButton(
              onPressed: () => _pickImage(false),
              child: const Text('Change Cover Image'),
            ),
            // Statistics
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text('Statistics', style: TextStyle(fontSize: 20, color: Colors.cyanAccent)),
                  const SizedBox(height: 8),
                  _buildStatRow('Completed Quests', '15'),
                  _buildStatRow('Accepted Missions', '23'),
                  _buildStatRow('Defeated Bosses', '8'),
                  _buildStatRow('Deaths', '5'),
                ],
              ),
            ),
            // Share App Button
            ElevatedButton.icon(
              onPressed: () {
                // Implement share functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sharing CrystalDream!')),
                );
              },
              icon: const Icon(Icons.share),
              label: const Text('Share the App with Friends'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70)),
        Text(value, style: const TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold)),
      ],
    );
  }
}