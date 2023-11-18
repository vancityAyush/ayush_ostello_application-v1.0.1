import 'package:get/get.dart';

import '../controller/wallet_screen_controller.dart';

/// A binding class for the WalletScreenScreen.
///
/// This class ensures that the WalletScreenController is created when the
/// WalletScreenScreen is first loaded.
class WalletScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalletScreenController());
  }
}
