import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techverse/providers/cart_provider.dart';
import 'package:techverse/screens/cart_screen.dart';
import 'package:techverse/screens/favorites_screen.dart';
import 'package:techverse/screens/home_screen.dart';
import 'package:techverse/screens/search_screen.dart';
import 'package:techverse/screens/settings_screen.dart';
import 'package:techverse/services/app_localizations.dart';

// A data class to hold the information for each screen in the bottom navigation.
class Screen {
  final Widget widget;
  final String title;
  final IconData icon;

  const Screen({
    required this.widget,
    required this.title,
    required this.icon,
  });
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  // A list of all the screens in the bottom navigation.
  final List<Screen> _screens = [
    const Screen(widget: HomeScreen(), title: 'home', icon: Icons.home),
    const Screen(widget: SearchScreen(), title: 'search', icon: Icons.search),
    const Screen(
        widget: CartScreen(), title: 'cart', icon: Icons.shopping_cart),
    const Screen(
        widget: FavoritesScreen(), title: 'favorites', icon: Icons.favorite),
    const Screen(
        widget: SettingsScreen(), title: 'settings', icon: Icons.settings),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final cartProvider = Provider.of<CartProvider>(context);

    // Build the bottom navigation bar items from the _screens list.
    final List<BottomNavigationBarItem> _navBarItems = _screens.map((screen) {
      if (screen.title == 'cart') {
        // Add a badge to the cart icon to show the number of items in the cart.
        return BottomNavigationBarItem(
          icon: badges.Badge(
            showBadge: cartProvider.itemCount > 0,
            badgeContent: Text(
              '${cartProvider.itemCount}',
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
            child: Icon(screen.icon),
          ),
          label: localizations.translate(screen.title),
        );
      } else {
        return BottomNavigationBarItem(
          icon: Icon(screen.icon),
          label: localizations.translate(screen.title),
        );
      }
    }).toList();

    return Scaffold(
      // Show the selected screen's widget.
      body: _screens[_selectedIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        items: _navBarItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // Set the bottom navigation bar to be fixed, so that all the items are visible.
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
