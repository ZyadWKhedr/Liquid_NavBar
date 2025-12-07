## 2.0.5
* **BREAKING**: Changed `icons` parameter from `List<IconData>` to `List<Widget>` to support any widget as an icon.
* **BREAKING**: Changed `icon` parameter in `NavbarItemWidget` from `IconData` to `Widget`.
* Added `selectedColor` and `unselectedColor` parameters to `NavbarWidget` for better customization.
* Fixed late initialization error using Riverpod

## 2.0.0
* Renamed package to "LiquidGlass NavBar"
* Updated horizontal padding parameter to be optional
* Updated documentation and examples

## 0.0.1

**Initial Release** 🎉

### Features
* ✨ Liquid glass floating navigation bar with beautiful glasomorphic design
* 🎯 Draggable indicator that smoothly snaps to navigation items
* 🌊 Parallax page transitions for smooth navigation experience
* 📱 Fully responsive and adaptive layout
* 🎨 Highly customizable with support for custom colors, sizes, and spacing
* ⚡ Efficient state management using Riverpod
* 🔧 Modular architecture with reusable components

### Components
* `BottomNavScaffold` - Main scaffold widget
* `NavbarWidget` - Navigation bar container
* `NavbarItemWidget` - Individual navigation items
* `NavbarDraggableIndicator` - Draggable liquid glass indicator
* `NavbarBackground` - Glasomorphic background
* `NavbarProviders` - State management
