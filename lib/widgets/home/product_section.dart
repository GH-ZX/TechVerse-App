import 'package:flutter/material.dart';
import 'package:techverse/models/product.dart';
import 'package:techverse/widgets/product_card.dart';
import 'package:techverse/widgets/section_title.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final List<Product> products;
  final VoidCallback onSeeAll;

  const ProductSection({
    super.key,
    required this.title,
    required this.products,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: title,
          onSeeAll: onSeeAll,
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          ),
        ),
      ],
    );
  }
}
