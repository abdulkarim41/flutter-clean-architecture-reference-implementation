import 'package:go_router/go_router.dart';
import 'package:navigation/navigation.dart';
import 'package:products/src/products_screen.dart';

class ProductsRouter implements BaseRouter {
  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesName.productScreen,
      builder: (context, state) => const ProductsScreen(),
    ),
  ];
}