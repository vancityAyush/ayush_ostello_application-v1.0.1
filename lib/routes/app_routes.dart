import 'package:get/get.dart';

import '../presentation/wallet/binding/wallet_screen.dart';
import '../presentation/wallet/wallet_recharge_screen.dart';
import '../presentation/wallet/wallet_screen.dart';

class AppRoutes {
  static const String WalletScreenScreen = '/wallet';

  static const String walletScreenWithNoTransactionsScreen =
      '/wallet_screen_with_no_transactions_screen';

  static const String WalletScreenOneScreen =
      '/wallet_screen_with_transactions_one_screen';

  static const String filtersAppliedScreen = '/filters_applied_screen';

  static const String proceedToRechargeScreen = '/proceed_to_recharge_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: WalletScreenScreen,
      page: () => WalletScreen(),
      bindings: [
        WalletScreenBinding(),
      ],
    ),
    GetPage(
      name: proceedToRechargeScreen,
      page: () => WalletRechargeScreen(),
      bindings: [],
    ),
    GetPage(
      name: initialRoute,
      page: () => WalletScreen(),
      bindings: [
        WalletScreenBinding(),
      ],
    )
  ];
}
