
import 'package:cart/src/cart_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/navigation.dart';

class CartRouter implements BaseRouter {

  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesPath.cartScreenPath,
      name: AppRoutesName.cartScreenName,
      builder: (context, state) => CartScreen(),
    ),
  ];
}