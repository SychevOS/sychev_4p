class MenuItem {
  final String id;
  final String name;
  final String category;
  final double price;
  final String? description;
  final bool isAvailable;


  MenuItem({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.description,
    this.isAvailable = true,

  });

  MenuItem copyWith({
    String? name,
    String? category,
    double? price,
    String? description,
    bool? isAvailable,
    String? imageUrl,
  }) {
    return MenuItem(
      id: id,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      description: description ?? this.description,
      isAvailable: isAvailable ?? this.isAvailable,

    );
  }
}