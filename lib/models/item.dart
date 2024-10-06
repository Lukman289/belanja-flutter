import 'dart:ffi';

class Item {
  String name;
  int price;
  String photo;
  double rating;
  int stok;
  Item({
    required this.name,
    required this.price,
    required this.photo,
    required this.rating,
    required this.stok
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'] ?? '', // Mengambil nilai 'name' dari Map
      price: map['price'] ?? 0, // Mengambil nilai 'price' dari Map
      photo: map['photo'] ?? '', // Mengambil nilai 'photo' dari Map
      rating: (map['rating'] ?? 0.0).toDouble(), // Mengambil nilai 'rating' dari Map
      stok: map['stok'] ?? 0, // Mengambil nilai 'stok' dari Map
    );
  }

  // Metode untuk mengonversi Item ke Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'photo': photo,
      'rating': rating,
      'stok': stok,
    };
  }
}