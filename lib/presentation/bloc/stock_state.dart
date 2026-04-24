import 'package:stocks/data/models/stock_model.dart';

class StockState {
  final Map<int, List<Stock>> watchlists;
  final int selectedIndex;
  final String searchQuery;

  StockState({
    required this.watchlists,
    required this.selectedIndex,
    required this.searchQuery,
  });

  List<Stock> get filteredStocks {
    final stocks = watchlists[selectedIndex] ?? [];

    if (searchQuery.isEmpty) return stocks;

    return stocks
        .where((s) =>
            s.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  StockState copyWith({
    Map<int, List<Stock>>? watchlists,
    int? selectedIndex,
    String? searchQuery,
  }) {
    return StockState(
      watchlists: watchlists ?? this.watchlists,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}