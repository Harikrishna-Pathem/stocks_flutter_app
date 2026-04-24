import 'package:flutter/material.dart';

class MarketHeader extends StatelessWidget {
  const MarketHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Row(
        children: const [
          Expanded(
            child: _MarketItem(
              title: "SENSEX",
              value: "71,225.55",
              change: "+144.50",
              isPositive: true,
            ),
          ),

          /// 🔥 Custom Divider (reliable)
          _CustomDivider(),

          Expanded(
            child: _MarketItem(
              title: "NIFTY BANK",
              value: "54,174.80",
              change: "-12.10",
              isPositive: false,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 45, // 👈 controlled height
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey[700],
    );
  }
}

class _MarketItem extends StatelessWidget {
  final String title;
  final String value;
  final String change;
  final bool isPositive;

  const _MarketItem({
    required this.title,
    required this.value,
    required this.change,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Title
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 6),

        /// Value (bigger + bold)
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 6),

        /// Change with arrow
        Row(
          children: [
            Icon(
              isPositive ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: isPositive ? Colors.green : Colors.red,
              size: 18,
            ),
            Text(
              change,
              style: TextStyle(
                color: isPositive ? Colors.green : Colors.red,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}