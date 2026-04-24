class Stock {
  final String name;
  final double price;
  final double change;
  final bool isPositive;

  Stock({
    required this.name,
    required this.price,
    required this.change,
    required this.isPositive,
  });

  Stock copyWith({
    String? name,
    double? price,
    double? change,
    bool? isPositive,
  }) {
    return Stock(
      name: name ?? this.name,
      price: price ?? this.price,
      change: change ?? this.change,
      isPositive: isPositive ?? this.isPositive,
    );
  }
}