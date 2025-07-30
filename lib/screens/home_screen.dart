import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techverse/data/banner_data.dart';
import 'package:techverse/data/category_data.dart';
import 'package:techverse/providers/product_provider.dart';
import 'package:techverse/screens/product_list_screen.dart';
import 'package:techverse/screens/search_screen.dart';
import 'package:techverse/services/app_localizations.dart';
import 'package:techverse/widgets/home/banner_slider.dart';
import 'package:techverse/widgets/home/category_list.dart';
import 'package:techverse/widgets/home/product_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final categories = getCategories(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('app_name')),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: productProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () => productProvider.fetchProducts(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localizations.translate('Soon'),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 20),
                      BannerSlider(bannerData: bannerData),
                      const SizedBox(height: 24),
                      Text(
                        localizations.translate('categories'),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 12),
                      CategoryList(categories: categories),
                      const SizedBox(height: 25),
                      ProductSection(
                        title: localizations.translate('new_arrivals'),
                        products: productProvider.newArrivals,
                        onSeeAll: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductListScreen(
                                title: localizations.translate('new_arrivals'),
                                products: productProvider.newArrivals,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      ProductSection(
                        title: localizations.translate('best_sellers'),
                        products: productProvider.bestSellers,
                        onSeeAll: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductListScreen(
                                title: localizations.translate('best_sellers'),
                                products: productProvider.bestSellers,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      ProductSection(
                        title: localizations.translate('special_offers'),
                        products: productProvider.specialOffers,
                        onSeeAll: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductListScreen(
                                title:
                                    localizations.translate('special_offers'),
                                products: productProvider.specialOffers,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
