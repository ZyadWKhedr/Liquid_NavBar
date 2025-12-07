# LiquidGlass NavBar 🌊

A beautiful, customizable liquid-glass floating navigation bar for Flutter with a draggable indicator and parallax page transitions.


https://github.com/user-attachments/assets/1d4dda9d-4da8-476f-ad0c-b1ee8d4ffd93


![Version](https://img.shields.io/badge/version-0.0.1-blue)
![Flutter](https://img.shields.io/badge/flutter-%3E%3D2.19.0-blue)

## ✨ Features

- **Liquid Glass Design**: Beautiful glasomorphic navigation bar with liquid glass effects
- **Draggable Indicator**: Smooth, draggable indicator that snaps to navigation items
- **Parallax Pages**: Subtle parallax effect when navigating between pages
- **Adaptive Layout**: Automatically adjusts to different screen sizes and item counts
- **Customizable**: Full control over colors, sizes, spacing, and styling
- **State Management**: Built with Riverpod for efficient state management
- **Responsive**: Uses ScreenUtil for perfect scaling across devices


https://github.com/user-attachments/assets/d2f8fa04-39fd-4add-9aed-670734aa0a35


## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  liquid_navbar: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## 🚀 Quick Start

### Basic Usage

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_navbar/liquid_navbar.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavScaffold(
        pages: [
          HomePage(),
          SearchPage(),
          ProfilePage(),
        ],
        icons: [
          Icons.home,
          Icons.search,
          Icons.person,
        ],
        labels: [
          'Home',
          'Search',
          'Profile',
        ],
      ),
    );
  }
}
```

### Advanced Customization

```dart
BottomNavScaffold(
  pages: myPages,
  icons: myIcons,
  labels: myLabels,
  navbarHeight: 80,
  indicatorWidth: 80,
  bottomPadding: 25,
  selectedColor: Colors.blue,
  unselectedColor: Colors.grey.shade400,
  horizontalPadding: 15,
)
```

## 🎨 Customization Options

### BottomNavScaffold Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `pages` | `List<Widget>` | **Required** | List of pages to display |
| `icons` | `List<IconData>` | **Required** | List of icons for navbar items |
| `labels` | `List<String>` | **Required** | List of labels for navbar items |
| `navbarHeight` | `double` | `70` | Height of the navigation bar |
| `indicatorWidth` | `double` | `70` | Base width of the draggable indicator |
| `bottomPadding` | `double` | `20` | Padding from bottom of screen |
| `selectedColor` | `Color` | `Colors.amber` | Color for selected items |
| `unselectedColor` | `Color` | `Colors.grey` | Color for unselected items |
| `horizontalPadding` | `double` | `10` | Horizontal padding for items |

### NavbarItemWidget Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `icon` | `IconData` | **Required** | Icon to display |
| `label` | `String` | **Required** | Label text |
| `isSelected` | `bool` | **Required** | Whether item is selected |
| `onTap` | `VoidCallback` | **Required** | Callback when tapped |
| `selectedIconSize` | `double` | `28` | Size of selected icon |
| `unselectedIconSize` | `double` | `24` | Size of unselected icon |
| `selectedFontSize` | `double` | `12` | Font size when selected |
| `unselectedFontSize` | `double` | `10` | Font size when unselected |
| `selectedColor` | `Color` | `Colors.amber` | Color when selected |
| `unselectedColor` | `Color` | `Colors.grey` | Color when unselected |

## 🏗️ Architecture

The package is structured with modular, reusable components:

- **`BottomNavScaffold`**: Main scaffold widget that orchestrates pages and navbar
- **`NavbarWidget`**: Container widget for the navigation bar
- **`NavbarItemWidget`**: Individual navigation item with icon and label
- **`NavbarDraggableIndicator`**: Draggable liquid glass indicator
- **`NavbarBackground`**: Glasomorphic background container
- **`NavbarProviders`**: Riverpod state management for navbar state

## 🛠️ Dependencies

- `flutter_screenutil: ^5.9.3` - Responsive sizing
- `liquid_glass_renderer: ^0.2.0-dev.4` - Liquid glass effects
- `flutter_riverpod: ^3.0.3` - State management

## 📱 Platform Support

- ✅ iOS
- ✅ Android
- ✅ Web
- ✅ macOS
- ✅ Windows
- ✅ Linux

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👤 Author

**Zyad Khedr**
- Email: ziad.w.khedr@gmail.com
- GitHub: [@ZyadWKhedr](https://github.com/ZyadWKhedr)

## 🌟 Show Your Support

Give a ⭐️ if this project helped you!

## 📝 Changelog

See [CHANGELOG.md](CHANGELOG.md) for details on updates and version history.
