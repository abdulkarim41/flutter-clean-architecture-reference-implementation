import 'package:go_router/go_router.dart';
import 'package:navigation/navigation.dart';
import 'package:product_details/src/product_details_screen.dart';

class ProductDetailsRouter implements BaseRouter {
  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesPath.productDetailsScreenPath,
      name: AppRoutesName.productDetailsScreenName,
      builder: (context, state) {
        final String productId = state.pathParameters['id']!;
        return ProductDetailsScreen(productId: productId);
      },
      redirect: (context, state) {
        return null;
      },
    ),
  ];
}