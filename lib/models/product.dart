class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final List<String> images;
  final String description;
  final String descriptionAr;
  final Map<String, dynamic> specifications;
  final Map<String, dynamic> specificationsAr;
  final double rating;
  final int reviewCount;
  final bool inStock;
  final String brand;
  final DateTime createdAt;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.oldPrice,
    required this.imageUrl,
    required this.images,
    required this.description,
    required this.descriptionAr,
    required this.specifications,
    required this.specificationsAr,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.inStock = true,
    required this.brand,
    required this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      price: json['price'].toDouble(),
      oldPrice: json['old_price']?.toDouble(),
      imageUrl: json['image_url'],
      images: List<String>.from(json['images']).map((path) => path).toList(),
      description: json['description'],
      descriptionAr: json['description_ar'],
      specifications: Map<String, dynamic>.from(json['specifications']),
      specificationsAr: Map<String, dynamic>.from(json['specifications_ar']),
      rating: json['rating']?.toDouble() ?? 0.0,
      reviewCount: json['review_count'] ?? 0,
      inStock: json['in_stock'] ?? true,
      brand: json['brand'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'old_price': oldPrice,
      'image_url': imageUrl,
      'images': images,
      'description': description,
      'description_ar': descriptionAr,
      'specifications': specifications,
      'specifications_ar': specificationsAr,
      'rating': rating,
      'review_count': reviewCount,
      'in_stock': inStock,
      'brand': brand,
      'created_at': createdAt.toIso8601String(),
    };
  }

  double get discountPercentage {
    if (oldPrice == null || oldPrice! <= price) return 0.0;
    return ((oldPrice! - price) / oldPrice! * 100).roundToDouble();
  }

  bool get hasDiscount => oldPrice != null && oldPrice! > price;
}
