import 'package:flutter/material.dart';
import 'package:techverse/data/category_data.dart';
import 'package:techverse/screens/product_list_screen.dart';
import 'package:techverse/services/app_localizations.dart';
import 'package:techverse/widgets/category_card.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryCard(
            title: AppLocalizations.of(context).translate(category.title),
            icon: Icons.category,
            color: category.color,
            imageUrl: category.imageUrl,
            onTap: () => _navigateToProductList(context, category),
          );
        },
      ),
    );
  }

  void _navigateToProductList(BuildContext context, Category category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductListScreen(
          title: AppLocalizations.of(context).translate(category.title),
          brand: category.brand,
          category: category.category,
        ),
      ),
    );
  }
}
