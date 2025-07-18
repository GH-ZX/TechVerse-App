import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techverse/models/product.dart';
import 'package:techverse/providers/product_provider.dart';
import 'package:techverse/services/app_localizations.dart';
import 'package:techverse/widgets/product_grid_item.dart';

class ProductListScreen extends StatelessWidget {
  final String title;
  final String? category;
  final String? brand;
  final List<Product>? products;

  const ProductListScreen({
    super.key,
    required this.title,
    this.category,
    this.brand,
    this.products,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: FutureBuilder<List<Product>>(
        future: _getProducts(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text(localizations.translate('no_products_found')));
          }

          final displayProducts = snapshot.data!;
          return LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: constraints.maxWidth > 600 ? 4 : 2,
                  childAspectRatio: constraints.maxWidth > 600 ? 0.8 : 0.7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: displayProducts.length,
                itemBuilder: (context, index) {
                  return ProductGridItem(product: displayProducts[index]);
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<List<Product>> _getProducts(BuildContext context) {
    if (products != null) {
      return Future.value(products);
    }
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    if (brand != null) {
      return Future.value(productProvider.getProductsByBrand(brand!));
    }
    if (category != null) {
      if (category == 'Accessories') {
        // Return all products that are considered accessories (e.g., Headphones, Mice)
        return Future.value(productProvider.items.where((p) => p.category == 'Headphones' || p.category == 'Mice').toList());
      }
      return Future.value(productProvider.getProductsByCategory(category!));
    }
    return Future.value([]);
  }
}
