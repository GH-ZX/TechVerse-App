import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _items = [];
  bool _isLoading = false;
  String? _error;

  List<Product> get items => [..._items];
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 1));
      _items = _mockProducts; // Using mock data
    } catch (error) {
      _error = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String getImagePath(String path) {
    return 'assets/images/$path';
  }

  List<Product> getProductsByCategory(String category) {
    return _items.where((product) => product.category == category).toList();
  }

  List<Product> getProductsByBrand(String brand) {
    return _items.where((product) => product.brand == brand).toList();
  }

  List<Product> get newArrivals {
    final sortedProducts = [..._items];
    sortedProducts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return sortedProducts.take(8).toList();
  }

  List<Product> get bestSellers {
    final sortedProducts = [..._items];
    sortedProducts.sort((a, b) => b.rating.compareTo(a.rating));
    return sortedProducts.take(8).toList();
  }

  List<Product> get specialOffers {
    return _items.where((product) => product.hasDiscount).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  List<Product> searchProducts(String query) {
    if (query.isEmpty) return [];
    final lowercaseQuery = query.toLowerCase();
    return _items.where((product) {
      final lowercaseName = product.name.toLowerCase();
      final lowercaseBrand = product.brand.toLowerCase();
      final lowercaseDescription = product.description.toLowerCase();
      return lowercaseName.contains(lowercaseQuery) ||
          lowercaseBrand.contains(lowercaseQuery) ||
          lowercaseDescription.contains(lowercaseQuery);
    }).toList();
  }
}

final List<Product> _mockProducts = [
  Product(
    id: '1',
    name: 'Dell XPS 15',
    category: 'Laptop',
    price: 4999.99,
    oldPrice: 5499.99,
    imageUrl: 'laptops/dell/xps_15_main.png',
    images: [
      'laptops/dell/xps_15_side.png',
      'laptops/dell/xps_15_back.png',
    ],
    description:
        'Dell XPS 15 laptop with 12th Gen Intel Core i7 processor, high-resolution display, and long-lasting battery.',
    descriptionAr:
        'لابتوب ديل XPS 15 مع معالج انتل كور i7 من الجيل الثاني عشر وشاشة عالية الدقة وبطارية تدوم طويلاً.',
    specifications: {
      'processor': 'Intel Core i7-12700H',
      'memory': '16GB DDR5',
      'storage': '512GB SSD',
      'graphics': 'NVIDIA GeForce RTX 3050 Ti',
      'display': '15.6" 4K OLED Touch',
      'operating_system': 'Windows 11 Pro',
      'battery': '86Whr',
      'weight': '1.8 kg',
    },
    specificationsAr: {
      'المعالج': 'انتل كور i7-12700H',
      'الذاكرة': '16 جيجابايت DDR5',
      'التخزين': '512 جيجابايت SSD',
      'الرسومات': 'انفيديا جي فورس RTX 3050 Ti',
      'الشاشة': 'شاشة لمس OLED 4K مقاس 15.6 بوصة',
      'نظام التشغيل': 'ويندوز 11 برو',
      'البطارية': '86 واط/ساعة',
      'الوزن': '1.8 كجم',
    },
    rating: 4.8,
    reviewCount: 124,
    brand: 'Dell',
    createdAt: DateTime.now().subtract(const Duration(days: 30)),
  ),
  Product(
    id: '2',
    name: 'HP Spectre x360',
    category: 'Laptop',
    price: 4599.99,
    oldPrice: 4999.99,
    imageUrl: 'laptops/hp/spectre_x360_main.png',
    images: [
      'laptops/hp/spectre_x360_side.png',
      'laptops/hp/spectre_x360_back.png',
    ],
    description:
        'HP Spectre x360 convertible laptop with touchscreen, excellent performance, and elegant design.',
    descriptionAr:
        'لابتوب HP Spectre x360 قابل للتحويل مع شاشة لمس وأداء ممتاز وتصميم أنيق.',
    specifications: {
      'processor': 'Intel Core i7-1260P',
      'memory': '16GB LPDDR4x',
      'storage': '1TB SSD',
      'graphics': 'Intel Iris Xe',
      'display': '13.5" 3K2K OLED Touch',
      'operating_system': 'Windows 11 Home',
      'battery': '66Whr',
      'weight': '1.36 kg',
    },
    specificationsAr: {
      'المعالج': 'انتل كور i7-1260P',
      'الذاكرة': '16 جيجابايت LPDDR4x',
      'التخزين': '1 تيرابايت SSD',
      'الرسومات': 'انتل آيريس Xe',
      'الشاشة': 'شاشة لمس OLED 3K2K مقاس 13.5 بوصة',
      'نظام التشغيل': 'ويندوز 11 هوم',
      'البطارية': '66 واط/ساعة',
      'الوزن': '1.36 كجم',
    },
    rating: 4.7,
    reviewCount: 89,
    brand: 'HP',
    createdAt: DateTime.now().subtract(const Duration(days: 45)),
  ),
  Product(
    id: '3',
    name: 'Lenovo ThinkPad X1 Carbon',
    category: 'Laptop',
    price: 5299.99,
    imageUrl: 'laptops/lenovo/thinkpad_x1_carbon_main.png',
    images: [
      'laptops/lenovo/thinkpad_x1_carbon_side.png',
      'laptops/lenovo/thinkpad_x1_carbon_back.png',
    ],
    description:
        'Lenovo ThinkPad X1 Carbon laptop ideal for business with advanced security and excellent performance.',
    descriptionAr:
        'لابتوب لينوفو ThinkPad X1 Carbon مثالي للأعمال مع أمان متقدم وأداء ممتاز.',
    specifications: {
      'processor': 'Intel Core i7-1270P vPro',
      'memory': '16GB LPDDR5',
      'storage': '1TB SSD',
      'graphics': 'Intel Iris Xe',
      'display': '14" WUXGA IPS',
      'operating_system': 'Windows 11 Pro',
      'battery': '57Whr',
      'weight': '1.12 kg',
    },
    specificationsAr: {
      'المعالج': 'انتل كور i7-1270P vPro',
      'الذاكرة': '16 جيجابايت LPDDR5',
      'التخزين': '1 تيرابايت SSD',
      'الرسومات': 'انتل آيريس Xe',
      'الشاشة': 'شاشة IPS WUXGA مقاس 14 بوصة',
      'نظام التشغيل': 'ويندوز 11 برو',
      'البطارية': '57 واط/ساعة',
      'الوزن': '1.12 كجم',
    },
    rating: 4.9,
    reviewCount: 156,
    brand: 'Lenovo',
    createdAt: DateTime.now().subtract(const Duration(days: 15)),
  ),
  Product(
    id: '4',
    name: 'Samsung Galaxy Book3 Ultra',
    category: 'Laptop',
    price: 7999.99,
    oldPrice: 8499.99,
    imageUrl: 'laptops/samsung/book3_ultra_main.png',
    images: [
      'laptops/samsung/book3_ultra_side.png',
      'laptops/samsung/book3_ultra_back.png',
    ],
    description:
        'Samsung Galaxy Book3 Ultra laptop with powerful performance, stunning AMOLED display, and sleek design.',
    descriptionAr:
        'لابتوب Samsung Galaxy Book3 Ultra بأداء قوي، شاشة AMOLED مذهلة وتصميم أنيق.',
    specifications: {
      'processor': 'Intel Core i9-13900H',
      'memory': '32GB LPDDR5',
      'storage': '1TB SSD',
      'graphics': 'NVIDIA GeForce RTX 4070',
      'display': '16" 4K AMOLED Touch',
      'operating_system': 'Windows 11 Pro',
      'battery': '76Whr',
      'weight': '1.8 kg',
    },
    specificationsAr: {
      'المعالج': 'Intel Core i9-13900H',
      'الذاكرة': '32 جيجابايت LPDDR5',
      'التخزين': '1 تيرابايت SSD',
      'الرسومات': 'NVIDIA GeForce RTX 4070',
      'الشاشة': 'شاشة لمس AMOLED 4K مقاس 16 بوصة',
      'نظام التشغيل': 'ويندوز 11 برو',
      'البطارية': '76 واط/ساعة',
      'الوزن': '1.8 كجم',
    },
    rating: 4.8,
    reviewCount: 120,
    brand: 'Samsung',
    createdAt: DateTime.now().subtract(const Duration(days: 10)),
  ),
  Product(
    id: '5',
    name: 'MacBook Pro 16',
    category: 'Laptop',
    price: 8999.99,
    oldPrice: 9499.99,
    imageUrl: 'laptops/apple/macbook_pro_16_main.png',
    images: [
      'laptops/apple/macbook_pro_16_side.png',
      'laptops/apple/macbook_pro_16_back.png',
    ],
    description:
        'MacBook Pro 16 laptop with M2 Pro chip, Liquid Retina XDR display, and exceptional performance.',
    descriptionAr:
        'لابتوب ماك بوك برو 16 مع شريحة M2 Pro وشاشة Liquid Retina XDR وأداء استثنائي.',
    specifications: {
      'processor': 'Apple M2 Pro',
      'memory': '32GB Unified Memory',
      'storage': '1TB SSD',
      'graphics': 'Apple M2 Pro 19-core GPU',
      'display': '16.2" Liquid Retina XDR',
      'operating_system': 'macOS',
      'battery': 'Up to 22 hours',
      'weight': '2.15 kg',
    },
    specificationsAr: {
      'المعالج': 'Apple M2 Pro',
      'الذاكرة': '32GB Unified Memory',
      'التخزين': '1TB SSD',
      'الرسومات': 'Apple M2 Pro 19-core GPU',
      'الشاشة': '16.2" Liquid Retina XDR',
      'نظام التشغيل': 'macOS',
      'البطارية': 'Up to 22 hours',
      'الوزن': '2.15 كجم',
    },
    rating: 4.9,
    reviewCount: 205,
    brand: 'Apple',
    createdAt: DateTime.now().subtract(const Duration(days: 10)),
  ),
];
