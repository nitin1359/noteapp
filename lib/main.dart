import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import the services package
import 'screens/note_list_screen.dart';
import 'app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the system navigation bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:
          Colors.grey.shade700, // Set the color to match your app's background
      systemNavigationBarIconBrightness:
          Brightness.light, // Ensure icons are visible
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note App',
      theme: appTheme,
      home: const NoteListScreen(),
    );
  }
}
