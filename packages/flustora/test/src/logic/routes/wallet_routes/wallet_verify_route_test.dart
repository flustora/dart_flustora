import 'package:flustora/flustora.dart';
import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/wallet/wallet_verify_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late WalletVerifyController _walletVerifyController;

  setUp(() {
    _walletVerifyController = insert.sl<WalletVerifyController>();
  });

  group('WalletVerifyRoute =>', () {
    // write tests
    test(
      "the getWalletVerify function's route should return a good response in the object Type",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _walletVerifyController.getWalletVerify(
          walletAddress: 'f01234',
          signature: "Ynl0ZSBhcnJheD==",
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Wallet.getWalletVerify(
          walletAddress: 'f01234',
          signature: "Ynl0ZSBhcnJheD==",
        );
        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );
    test(
      "the getWalletVerify function's route should return Error which is a Map<String,dynamic> Type if the walletaddres is empty",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _walletVerifyController.getWalletVerify(
          walletAddress: '',
          signature: '',
        );

        //Act - Call the function that is to be tested

        final verifyValue = await Wallet.getWalletVerify(
          walletAddress: '',
          signature: '',
        );
        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );
  });
}
