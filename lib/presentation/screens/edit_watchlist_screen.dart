import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stocks/presentation/bloc/stock_bloc.dart';
import 'package:stocks/presentation/bloc/stock_event.dart';
import 'package:stocks/presentation/bloc/stock_state.dart';

class EditWatchlistScreen extends StatelessWidget {
  const EditWatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("Edit Watchlist 1"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),

      body: SafeArea(
        child: Column(
          children: [
            /// 🔹 Watchlist Name Box (like your screenshot)
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Watchlist 1",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Icon(Icons.edit, color: Colors.grey),
                ],
              ),
            ),

            /// 🔹 Reorder + Delete List
            Expanded(
              child: BlocBuilder<StockBloc, StockState>(
                builder: (context, state) {
                  final stocks =
                      state.watchlists[state.selectedIndex] ?? [];

                  if (stocks.isEmpty) {
                    return const Center(
                      child: Text(
                        "No stocks available",
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }

                  return ReorderableListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),

                    itemCount: stocks.length,

                    onReorder: (oldIndex, newIndex) {
                      context.read<StockBloc>().add(
                            ReorderStocks(oldIndex, newIndex),
                          );
                    },

                    itemBuilder: (context, index) {
                      final stock = stocks[index];

                      return Container(
                        key: ValueKey(stock.name),
                        margin: const EdgeInsets.only(bottom: 8),

                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),

                          /// Drag Handle
                          leading: const Icon(
                            Icons.drag_handle,
                            color: Colors.grey,
                          ),

                          /// Stock Name
                          title: Text(
                            stock.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),

                          /// Delete Button
                          trailing: IconButton(
                            icon: const Icon(Icons.delete,
                                color: Colors.redAccent),
                            onPressed: () {
                              context.read<StockBloc>().add(
                                    DeleteStock(index),
                                  );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            /// 🔹 Bottom Button (like screenshot)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Edit other watchlists",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}