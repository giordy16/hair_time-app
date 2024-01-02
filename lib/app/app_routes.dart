import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hair_time/ui/b2c/bookingHistory/BookingHistory.dart';
import 'package:hair_time/ui/b2c/booking_flow/booking_flow_page.dart';
import 'package:hair_time/ui/b2c/home/home_client_page.dart';
import 'package:hair_time/ui/b2c/profile/ProfilePage.dart';
import 'package:hair_time/ui/b2c/shop/shop_detail_page.dart';
import 'package:hair_time/ui/b2c/shop_list/shop_list_page.dart';
import 'package:hair_time/ui/select_user_type/select_user_type_page.dart';
import 'package:hair_time/ui/b2b/registration/shop_registration_page.dart';
import 'package:hair_time/ui/splash/splash_page.dart';

import '../models/network/shop/ShopModel.dart';
import '../ui/b2c/booking_flow/booking_step_1_day.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _clientHomeNavigatorKey = GlobalKey<NavigatorState>();

final appRoutes = GoRouter(
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
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ProfilePage.ROUTE,
              builder: (context, state) => ProfilePage(),
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
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: ShopRegistrationPage.ROUTE,
      builder: (context, state) => ShopRegistrationPage(),
    ),
  ],
);
