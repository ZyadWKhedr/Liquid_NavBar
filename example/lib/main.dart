import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_navbar/liquid_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Liquid Navbar Example',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const NavbarExamplePage(),
        );
      },
    );
  }
}

class NavbarExamplePage extends StatelessWidget {
  const NavbarExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavScaffold(
      // Pages to show
      pages: const [
        ColoredPage(color: Colors.red, label: 'Home Page'),
        ColoredPage(color: Colors.green, label: 'Search Page'),
        ColoredPage(color: Colors.blue, label: 'Profile Page'),
        ColoredPage(color: Colors.orange, label: 'Settings Page'),
      ],

      // Navbar icons
      icons: const [
        Icon(Icons.home_rounded),
        Icon(Icons.search_rounded),
        Icon(Icons.person_rounded),
        Icon(Icons.settings_rounded),
      ],

      // Labels
      labels: const [
        'Home',
        'Search',
        'Profile',
        'Settings',
      ],

      // Optional customization
      navbarHeight: 70,
      indicatorWidth: 70,
      bottomPadding: 20,
      selectedColor: Colors.amber,
      unselectedColor: Colors.grey,
      horizontalPadding: 16,
    );
  }
}

/// Simple colored page for demo
class ColoredPage extends StatelessWidget {
  final Color color;
  final String label;

  const ColoredPage({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
