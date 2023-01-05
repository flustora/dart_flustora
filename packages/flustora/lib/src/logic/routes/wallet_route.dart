import '../../injection.dart';
import '../controllers/wallet/wallet_balance_controller.dart';
import '../controllers/wallet/wallet_validate_address_controller.dart';
import '../controllers/wallet/wallet_verify_controller.dart';

class Wallet {
  static Future<Map<String, dynamic>> getWalletBalance({
    required String walletAddress,
  }) async =>
      await sl<WalletBalanceController>()
          .getWalletBalance(walletAddress: walletAddress);

  static Future<Map<String, dynamic>> getWalletValidateAddress({
    required String walletAddress,
  }) async =>
      await sl<WalletValidateAddressController>().getWalletValidateAddress(
        walletAddress: walletAddress,
      );

  static Future<Map<String, dynamic>> getWalletVerify({
    required String walletAddress,
    required String signature,
  }) async =>
      await sl<WalletVerifyController>().getWalletVerify(
        walletAddress: walletAddress,
        signature: signature,
      );
}
