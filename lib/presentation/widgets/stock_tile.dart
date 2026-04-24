import 'package:flutter/material.dart';
import 'package:stocks/data/models/stock_model.dart';

class StockTile extends StatelessWidget {
  final Stock stock;

  const StockTile({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey[900],
      title: Text(stock.name, style: TextStyle(color: Colors.white)),
      subtitle: Text(
        "${stock.price}",
        style: TextStyle(color: Colors.grey),
      ),
      trailing: Text(
        "${stock.change}%",
        style: TextStyle(
          color: stock.isPositive ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}