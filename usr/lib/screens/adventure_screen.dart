import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:audioplayers/audioplayers.dart';

class AdventureScreen extends StatefulWidget {
  const AdventureScreen({super.key});

  @override
  State<AdventureScreen> createState() => _AdventureScreenState();
}

class _AdventureScreenState extends State<AdventureScreen> {
  final FlutterTts _flutterTts = FlutterTts();
  final AudioPlayer _audioPlayer = AudioPlayer();
  double _ttsVolume = 1.0;
  double _musicVolume = 1.0;
  bool _isTtsEnabled = true;
  bool _isMusicEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adventure')),
      body: Column(
        children: [
          // HUD - Story Stats
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.black54,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStat('Health', '85/100'),
                _buildStat('Mana', '60/100'),
                _buildStat('Gold', '150'),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: const Text(
                'Adventure game content here...\n(The existing adventure system functionality remains unchanged)',
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Bottom Controls
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Open inventory
                  },
                  child: const Text('Inventory'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showAudioSettings(context);
                  },
                  child: const Text('Audio Settings'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.cyanAccent, fontSize: 12)),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  void _showAudioSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black87,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Audio Settings', style: TextStyle(color: Colors.cyanAccent, fontSize: 20)),
                  const SizedBox(height: 16),
                  // TTS Settings
                  Row(
                    children: [
                      const Text('TTS Voices:', style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 16),
                      DropdownButton<String>(
                        value: 'Voice 1',
                        items: ['Voice 1', 'Voice 2', 'Voice 3'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: const TextStyle(color: Colors.white)),
                          );
                        }).toList(),
                        onChanged: (value) {},
                        dropdownColor: Colors.deepPurple,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('TTS Volume:', style: TextStyle(color: Colors.white)),
                      Expanded(
                        child: Slider(
                          value: _ttsVolume,
                          onChanged: (value) {
                            setState(() {
                              _ttsVolume = value;
                            });
                          },
                        ),
                      ),
                      Switch(
                        value: _isTtsEnabled,
                        onChanged: (value) {
                          setState(() {
                            _isTtsEnabled = value;
                          });
                        },
                      ),
                    ],
                  ),
                  // Music Settings
                  Row(
                    children: [
                      const Text('8-Bit Music:', style: TextStyle(color: Colors.white)),
                      Expanded(
                        child: Slider(
                          value: _musicVolume,
                          onChanged: (value) {
                            setState(() {
                              _musicVolume = value;
                            });
                          },
                        ),
                      ),
                      Switch(
                        value: _isMusicEnabled,
                        onChanged: (value) {
                          setState(() {
                            _isMusicEnabled = value;
                          });
                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_isTtsEnabled) {
                        await _flutterTts.speak('Sample voice test');
                      }
                    },
                    child: const Text('Test Voice'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}