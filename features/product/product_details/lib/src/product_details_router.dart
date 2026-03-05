import 'package:go_router/go_router.dart';
import 'package:navigation/navigation.dart';
import 'package:product_details/src/product_details_screen.dart';

class ProductDetailsRouter implements BaseRouter {
  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesName.productDetailsScreen,
      name: AppRoutesName.productDetailsScreen,
      builder: (context, state) => const ProductDetailsScreen(),
      redirect: (context, state) {
        return null;
      },
    ),
  ];
}