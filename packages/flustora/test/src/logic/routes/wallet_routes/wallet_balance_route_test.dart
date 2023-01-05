import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/wallet/wallet_balance_controller.dart';
import 'package:flustora/src/logic/routes/wallet_route.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late WalletBalanceController _walletBalanceController;

  setUp(() {
    _walletBalanceController = insert.sl<WalletBalanceController>();
  });

  group('WalletRoute =>', () {
    // write tests

    test(
        "the getWalletBalance function's route should return good response if all the logic is good or Error if the the package's user is not connected and the response will be a Map<String,dynamic> Type",
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      final testValue =
          await _walletBalanceController.getWalletBalance(walletAddress: "f01");

      //Act - Call the function that is to be tested

      final verifyValue = await Wallet.getWalletBalance(walletAddress: "f01");

      //Assert - Compare the actual result and expected result
      expect(testValue, verifyValue);
    });

    test(
        "the getWalletBalance function's route should return Error which is a Map<String,dynamic> Type if the walletaddres is empty",
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      final testValue =
          await _walletBalanceController.getWalletBalance(walletAddress: "");

      //Act - Call the function that is to be tested

      final verifyValue = await Wallet.getWalletBalance(walletAddress: "");

      //Assert - Compare the actual result and expected result
      expect(testValue, verifyValue);
    });
  });
}
