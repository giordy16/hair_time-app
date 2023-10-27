import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hair_time/ui/client/bookingHistory/BookingHistory.dart';
import 'package:hair_time/ui/client/booking_flow/booking_flow_page.dart';
import 'package:hair_time/ui/client/home/home_client_page.dart';
import 'package:hair_time/ui/client/shop/shop_detail_page.dart';
import 'package:hair_time/ui/client/shop_list/shop_list_page.dart';
import 'package:hair_time/ui/select_user_type/select_user_type_page.dart';
import 'package:hair_time/ui/splash/splash_page.dart';

import '../models/network/shop/ShopModel.dart';
import '../ui/client/booking_flow/booking_step_1_day.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _clientHomeNavigatorKey = GlobalKey<NavigatorState>();

final app_routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: SplashPage.ROUTE,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => HomePageClientWithNavBar(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ShopList.ROUTE,
              builder: (context, state) => ShopList(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/test',
              builder: (context, state) => BookingHistory(),
            ),
          ],
        )
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: SplashPage.ROUTE,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: SelectUserType.ROUTE,
      builder: (context, state) => const SelectUserType(),
    ),
    GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: ShopDetailPage.ROUTE,
        builder: (context, state) {
          ShopModel shop = state.extra as ShopModel;
          return ShopDetailPage(
            shop: shop,
          );
        }),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: BookingFlowPage.ROUTE,
      builder: (context, state) => BookingFlowPage(),
    ),
  ],
);
