import 'package:stocks/data/models/stock_model.dart';

class StockRepository {
  List<Stock> getStocks1() => [
        Stock(name: "RELIANCE", price: 1374.10, change: -4.40, isPositive: false),
        Stock(name: "HDFCBANK", price: 966.95, change: 0.95, isPositive: true),
        Stock(name: "ASIANPAINT", price: 2537.40, change: 6.60, isPositive: true),
        Stock(name: "NIFTY IT", price: 35184.30, change: 873.86, isPositive: true),
        Stock(name: "RELIANCE SEP 1880 CE", price: 0.00, change: 0.00, isPositive: true),
        Stock(name: "RELIANCE SEP 1370 PE", price: 19.20, change: 1.00, isPositive: true),
        Stock(name: "MRF", price: 147625.00, change: 550.00, isPositive: true),
        Stock(name: "ICICIBANK", price: 1025.30, change: -3.25, isPositive: false),
        Stock(name: "LT", price: 3620.50, change: 22.10, isPositive: true),
        Stock(name: "SBIN", price: 620.40, change: -5.10, isPositive: false),
      ];

  List<Stock> getStocks2() => [
        Stock(name: "TCS", price: 3900.00, change: 12.00, isPositive: true),
        Stock(name: "INFY", price: 1500.00, change: -5.00, isPositive: false),
        Stock(name: "WIPRO", price: 480.20, change: 3.50, isPositive: true),
        Stock(name: "HCLTECH", price: 1350.10, change: -2.20, isPositive: false),
        Stock(name: "TECHM", price: 1285.75, change: 15.60, isPositive: true),
        Stock(name: "LTIM", price: 5120.30, change: -45.00, isPositive: false),
        Stock(name: "COFORGE", price: 6200.00, change: 120.00, isPositive: true),
        Stock(name: "PERSISTENT", price: 7200.50, change: -30.25, isPositive: false),
        Stock(name: "MPHASIS", price: 2500.00, change: 18.40, isPositive: true),
        Stock(name: "OFSS", price: 4200.10, change: -10.00, isPositive: false),
      ];

  List<Stock> getStocks3() => [
        Stock(name: "ITC", price: 450.00, change: 2.50, isPositive: true),
        Stock(name: "SBIN", price: 620.00, change: -3.00, isPositive: false),
        Stock(name: "AXISBANK", price: 1105.75, change: 6.20, isPositive: true),
        Stock(name: "KOTAKBANK", price: 1780.30, change: -12.40, isPositive: false),
        Stock(name: "BAJFINANCE", price: 7200.00, change: 45.00, isPositive: true),
        Stock(name: "BAJAJFINSV", price: 1620.50, change: -8.75, isPositive: false),
        Stock(name: "HDFC", price: 2800.00, change: 10.20, isPositive: true),
        Stock(name: "ULTRACEMCO", price: 9200.00, change: -25.00, isPositive: false),
        Stock(name: "TITAN", price: 3400.00, change: 35.50, isPositive: true),
        Stock(name: "ADANIENT", price: 3100.00, change: -15.60, isPositive: false),
      ];
}