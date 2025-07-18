import 'package:flutter/material.dart';

class Category {
  final String title;
  final IconData? icon;
  final Color color;
  final String? imageUrl;
  final String? brand;
  final String? category;

  Category({
    required this.title,
    this.icon,
    required this.color,
    this.imageUrl,
    this.brand,
    this.category,
  });
}

List<Category> getCategories(BuildContext context) {
  final bool isLightMode = Theme.of(context).brightness == Brightness.light;

  return [
    Category(
      title: 'All Brands',
      icon: Icons.laptop_rounded,
      color: isLightMode ? Colors.grey.shade700 : const Color.fromARGB(255, 199, 193, 193),
      category: 'Laptop',
    ),
    Category(
      title: 'Dell',
      icon: Icons.laptop_mac,
      color: isLightMode ? Colors.blue.shade800 : Colors.blue.shade400,
      imageUrl: 'laptops/dell/dell.png',
      brand: 'Dell',
    ),
    Category(
      title: 'ASUS',
      icon: Icons.laptop,
      color: isLightMode ? Colors.deepPurple.shade600 : Colors.purple.shade400,
      imageUrl: 'laptops/asus/asus.png',
      brand: 'ASUS',
    ),
    Category(
      title: 'MSI',
      icon: Icons.laptop,
      color: isLightMode ? Colors.red.shade900 : Colors.red.shade400,
      imageUrl: 'laptops/msi/msi.png',
      brand: 'MSI',
    ),
    Category(
      title: 'Apple',
      icon: Icons.laptop_mac,
      color: isLightMode ? Colors.grey.shade600 : Colors.grey.shade400,
      imageUrl: 'laptops/apple/apple.png',
      brand: 'Apple',
    ),
    Category(
      title: 'Microsoft',
      icon: Icons.laptop,
      color: isLightMode ? Colors.orange.shade900 : Colors.orange.shade200,
      imageUrl: 'laptops/microsoft/microsoft.png',
      brand: 'Microsoft',
    ),
    Category(
      title: 'Alienware',
      icon: Icons.laptop,
      color: isLightMode ? Colors.grey.shade700 : Colors.grey.shade300,
      imageUrl: 'laptops/alienware/alienware.png',
      brand: 'Alienware',
    ),
    Category(
      title: 'Acer',
      icon: Icons.laptop,
      color: isLightMode ? Colors.green.shade700 : Colors.green.shade300,
      imageUrl: 'laptops/acer/acer.png',
      brand: 'Acer',
    ),
    Category(
      title: 'Lenovo',
      icon: Icons.laptop,
      color: isLightMode ? Colors.red.shade700 : Colors.red.shade400,
      imageUrl: 'laptops/lenovo/lenovo.png',
      brand: 'Lenovo',
    ),
    Category(
      title: 'Samsung',
      icon: Icons.laptop,
      color: isLightMode ? Colors.blue.shade700 : Colors.blue.shade400,
      imageUrl: 'laptops/samsung/samsung.png',
      brand: 'Samsung',
    ),
  ];
}
