abstract class StockEvent {}

class LoadStocks extends StockEvent {}

class ChangeWatchlist extends StockEvent {
  final int index;
  ChangeWatchlist(this.index);
}

class SearchStock extends StockEvent {
  final String query;
  SearchStock(this.query);
}

class ReorderStocks extends StockEvent {
  final int oldIndex;
  final int newIndex;
  ReorderStocks(this.oldIndex, this.newIndex);
}

class DeleteStock extends StockEvent {
  final int index;
  DeleteStock(this.index);
}