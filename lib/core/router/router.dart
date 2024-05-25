import 'package:auto_route/auto_route.dart';
import 'package:spenditure/core/router/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  late final List<AutoRoute> routes = [
    AdaptiveRoute(
      page: NavbarRoute.page,
      path: '/navbar',
      initial: true,
    ),
    AdaptiveRoute(page: HomeRoute.page, path: '/home'),
    AdaptiveRoute(page: TransactionRoute.page, path: '/transaction'),
    AdaptiveRoute(page: BudgetRoute.page, path: '/budget'),
    AdaptiveRoute(page: ProfileRoute.page, path: '/profile'),
  ];
}
