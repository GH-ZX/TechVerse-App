import 'package:flutter/material.dart';
import 'package:techverse/data/category_data.dart';
import 'package:techverse/screens/product_list_screen.dart';
import 'package:techverse/services/app_localizations.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final categories = getCategories(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('categories')),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductListScreen(
                        title: localizations.translate('Laptops'),
                        category: 'Laptop',
                      ),
                    ),
                  );
                },
                child: Text(
                  localizations.translate('Laptops'),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 3 / 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final category = categories[index];
                  if (category.isSeparator) {
                    return const SizedBox.shrink(); // Hide the separator in the grid
                  }
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductListScreen(
                              title: localizations.translate(category.title),
                              category: category.category,
                              brand: category.brand,
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (category.imageUrl != null)
                            Image.asset(
                              'assets/images/${category.imageUrl}',
                              height: 60,
                              width: 60,
                              fit: BoxFit.contain,
                            )
                          else if (category.icon != null)
                            Icon(
                              category.icon,
                              size: 50,
                              color: category.color,
                            ),
                          const SizedBox(height: 8),
                          Text(
                            localizations.translate(category.title),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: categories.indexWhere((cat) => cat.isSeparator), // Only show categories before the separator
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: InkWell(
                onTap: () {
                  // Navigate to a screen showing all accessories, or filter the current screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductListScreen(
                        title: localizations.translate('Accessories'),
                        category: 'Accessories', // Assuming 'Accessories' is a valid category to filter by
                      ),
                    ),
                  );
                },
                child: Text(
                  localizations.translate('Accessories'),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 3 / 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final accessoryCategories = categories.where((cat) => cat.category == 'Headphones' || cat.category == 'Mice').toList();
                  final category = accessoryCategories[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductListScreen(
                              title: localizations.translate(category.title),
                              category: category.category,
                              brand: category.brand,
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (category.imageUrl != null)
                            Image.asset(
                              'assets/images/${category.imageUrl}',
                              height: 60,
                              width: 60,
                              fit: BoxFit.contain,
                            )
                          else if (category.icon != null)
                            Icon(
                              category.icon,
                              size: 50,
                              color: category.color,
                            ),
                          const SizedBox(height: 8),
                          Text(
                            localizations.translate(category.title),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: categories.where((cat) => cat.category == 'Headphones' || cat.category == 'Mice').length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
