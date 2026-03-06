import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavigationShell({super.key, required this.navigationShell});

  void _onTabChange(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  Future<void> _showExitDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Are you sure you want to exit?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () => dialogContext.pop(),
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () => SystemNavigator.pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) return;

        if (context.canPop()) {
          context.pop();
        } else if (navigationShell.currentIndex != 0) {
          navigationShell.goBranch(0);
        } else {
          _showExitDialog(context);
        }
      },
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            height: 65,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(blurRadius: 20, color: Colors.black12),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(3, (index) {
                final items = [
                  (Icons.home_outlined, Icons.home, "Product"),
                  (Icons.shopping_cart_outlined, Icons.shopping_cart, "Cart"),
                  (Icons.person_outline, Icons.person, "Profile"),
                ];

                final selected = navigationShell.currentIndex == index;

                return GestureDetector(
                  onTap: () => _onTabChange(index),

                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? Theme.of(
                              context,
                            ).colorScheme.primary.withOpacity(.15)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Row(
                      children: [
                        Icon(
                          selected ? items[index].$2 : items[index].$1,
                          color: selected
                              ? Theme.of(context).colorScheme.primary
                              : Colors.black54,
                        ),

                        if (selected) ...[
                          const SizedBox(width: 6),

                          Text(
                            items[index].$3,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
