import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final num productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Placeholder for the app bar
          const SliverAppBar(title: Text('Product Details'), floating: true),
          // Placeholder for product details content
          SliverToBoxAdapter(
            child: Center(child: Text('Details for product ID: $productId')),
          ),
        ],
      ),
    );
  }
}
