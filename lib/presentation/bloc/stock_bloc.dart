import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks/data/models/stock_model.dart';
import 'package:stocks/data/repository/stock_repository.dart';
import 'package:stocks/presentation/bloc/stock_event.dart';
import 'package:stocks/presentation/bloc/stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final StockRepository repository;

  StockBloc(this.repository)
      : super(StockState(
          watchlists: {},
          selectedIndex: 0,
          searchQuery: "",
        )) {
    on<LoadStocks>((event, emit) {
      emit(state.copyWith(
        watchlists: {
          0: repository.getStocks1(),
          1: repository.getStocks2(),
          2: repository.getStocks3(),
        },
      ));
    });

    on<ChangeWatchlist>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });

    on<SearchStock>((event, emit) {
      emit(state.copyWith(searchQuery: event.query));
    });

    on<ReorderStocks>((event, emit) {
      final currentList =
          List<Stock>.from(state.watchlists[state.selectedIndex]!);

      int newIndex = event.newIndex;
      if (event.oldIndex < newIndex) newIndex--;

      final item = currentList.removeAt(event.oldIndex);
      currentList.insert(newIndex, item);

      final updatedMap = Map<int, List<Stock>>.from(state.watchlists);
      updatedMap[state.selectedIndex] = currentList;

      emit(state.copyWith(watchlists: updatedMap));
    });

    on<DeleteStock>((event, emit) {
      final currentList =
          List<Stock>.from(state.watchlists[state.selectedIndex]!);

      currentList.removeAt(event.index);

      final updatedMap = Map<int, List<Stock>>.from(state.watchlists);
      updatedMap[state.selectedIndex] = currentList;

      emit(state.copyWith(watchlists: updatedMap));
    });
  }
}