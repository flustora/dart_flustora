import 'package:flustora/flustora.dart';
import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/wallet/wallet_validate_address_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late WalletValidateAddressController _walletValidateAddressController;

  setUp(() {
    _walletValidateAddressController =
        insert.sl<WalletValidateAddressController>();
  });

  group('WalletValidateAddressRoute =>', () {
    // write tests
    test(
      "the getWalletValidateAddress function's route should return a good response in the object Type",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _walletValidateAddressController
            .getWalletValidateAddress(walletAddress: 'f01234');

        //Act - Call the function that is to be tested

        final verifyValue = await Wallet.getWalletValidateAddress(
          walletAddress: 'f01234',
        );
        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );
    test(
      "the getWalletValidateAddress function's route should return Error which is a Map<String,dynamic> Type if the walletaddres is empty",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _walletValidateAddressController
            .getWalletValidateAddress(walletAddress: '');

        //Act - Call the function that is to be tested

        final verifyValue =
            await Wallet.getWalletValidateAddress(walletAddress: '');
        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );
  });
}
