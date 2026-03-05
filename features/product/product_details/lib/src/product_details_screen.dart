import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        leading: BackButton(
          onPressed: () {
            context.go('/product');
          },
        ),
      ),
      body: Center(
        child: Text(
          'Product id is : $productId',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}