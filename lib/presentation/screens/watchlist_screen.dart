import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stocks/presentation/bloc/stock_bloc.dart';
import 'package:stocks/presentation/bloc/stock_event.dart';
import 'package:stocks/presentation/bloc/stock_state.dart';

import 'package:stocks/presentation/screens/edit_watchlist_screen.dart';
import 'package:stocks/presentation/widgets/market_header.dart';
import 'package:stocks/presentation/widgets/stock_tile.dart';
import 'package:stocks/presentation/widgets/watchlist_tabs.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("Watchlist"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),

      body: SafeArea(
        child: Column(
          children: [
            /// 🔥 FIXED HEADER (NO TRANSPARENCY)
            Container(
              color: Colors.black, // ✅ important
              child: Column(
                children: [
                  /// Market Header
                  const MarketHeader(),

                  /// Search
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      onChanged: (value) {
                        context
                            .read<StockBloc>()
                            .add(SearchStock(value));
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Search for instruments",
                        hintStyle:
                            const TextStyle(color: Colors.grey),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[900], // ✅ important
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  /// Tabs + Edit
                  BlocBuilder<StockBloc, StockState>(
                    builder: (context, state) {
                      return Container(
                        color: Colors.black, // ✅ prevents bleed
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: WatchlistTabs(
                                selectedIndex:
                                    state.selectedIndex,
                                onTabChange: (index) {
                                  context
                                      .read<StockBloc>()
                                      .add(
                                        ChangeWatchlist(index),
                                      );
                                },
                              ),
                            ),

                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const EditWatchlistScreen(),
                                  ),
                                );
                              },
                              child: const Text("Edit"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            /// 📊 ONLY THIS SCROLLS
            Expanded(
              child: BlocBuilder<StockBloc, StockState>(
                builder: (context, state) {
                  final stocks = state.filteredStocks;

                  if (stocks.isEmpty) {
                    return const Center(
                      child: Text(
                        "No stocks found",
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.only(top: 8),
                    itemCount: stocks.length,
                    separatorBuilder: (_, __) =>
                        Divider(color: Colors.grey[800], height: 1),
                    itemBuilder: (context, index) {
                      return StockTile(stock: stocks[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}