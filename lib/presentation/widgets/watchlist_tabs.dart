import 'package:flutter/material.dart';

class WatchlistTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const WatchlistTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = ["Watchlist 1", "Watchlist 5", "Watchlist 6"];

    return Row(
      children: List.generate(tabs.length, (index) {
        final isSelected = index == selectedIndex;

        return GestureDetector(
          onTap: () => onTabChange(index),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                Text(
                  tabs[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey,
                  ),
                ),
                if (isSelected)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    height: 2,
                    width: 40,
                    color: Colors.white,
                  )
              ],
            ),
          ),
        );
      }),
    );
  }
}