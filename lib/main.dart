import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stocks/data/repository/stock_repository.dart';
import 'package:stocks/presentation/bloc/stock_bloc.dart';
import 'package:stocks/presentation/bloc/stock_event.dart';
import 'package:stocks/presentation/screens/watchlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => StockRepository(),

      child: BlocProvider(
        create: (context) =>
            StockBloc(context.read<StockRepository>())
              ..add(LoadStocks()), // 🔥 trigger initial load

        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Stocks Watchlist',

          theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,

            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
              elevation: 0,
              centerTitle: false,
            ),

            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white),
            ),
          ),

          home: const WatchlistScreen(),
        ),
      ),
    );
  }
}