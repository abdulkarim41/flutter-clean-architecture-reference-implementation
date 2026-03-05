import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/navigation.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
            onPressed: () {
              context.pushNamed(
                AppRoutesName.productDetailsScreenName,
                pathParameters: {
                  'id': '123',
                },
              );
            },
            child: const Text('Navigate To Product Details Screen')
        )
      ),
    );
  }
}