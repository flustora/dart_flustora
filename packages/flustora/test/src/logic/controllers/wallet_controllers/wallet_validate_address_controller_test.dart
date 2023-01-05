import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/wallet/wallet_validate_address_abst.dart';
import 'package:flustora/src/logic/controllers/wallet/wallet_validate_address_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWalletValidateAddressAbst extends Mock
    implements WalletValidateAddressAbst {}

void main() {
  late MockWalletValidateAddressAbst _mockWalletValidateAddressAbst;
  late WalletValidateAddressController _walletValidateAddressController;
  setUp(() {
    _mockWalletValidateAddressAbst = MockWalletValidateAddressAbst();
    _walletValidateAddressController = WalletValidateAddressController(
      walletValidateAddressAbst: _mockWalletValidateAddressAbst,
    );
  });

  group('WalletValidateAddressController =>', () {
    // write tests

    test(
      "the getWalletValidateAddress function's controller should return a good response in the object Type ('message': 'good response',) ",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockWalletValidateAddressAbst.getWalletValidateAddress(
              walletAddress: 'f01234',
            )).thenAnswer((_) async => const Right(
              {
                "message": "good response",
              },
            ));
        late Map<String, dynamic> testValue;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockWalletValidateAddressAbst.getWalletValidateAddress(
            walletAddress: "f01234");
        result.fold(
          (fail) {
            testValue = fail;
          },
          (success) {
            testValue = success;
          },
        );
        //Act - Call the function that is to be tested

        final verifyValue = await _walletValidateAddressController
            .getWalletValidateAddress(walletAddress: "f01234");
        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
        verify(() => _mockWalletValidateAddressAbst.getWalletValidateAddress(
              walletAddress: 'f01234',
            )).called(2);

        verifyNoMoreInteractions(_mockWalletValidateAddressAbst);
      },
    );

    test(
      "the getWalletValidateAddress function's controller should return a bad response in the object Type ('message': 'You are offline')",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockWalletValidateAddressAbst.getWalletValidateAddress(
              walletAddress: 'f01234',
            )).thenAnswer((_) async => const Left(
              {
                "message": "You are offline",
              },
            ));
        late Map<String, dynamic> testValue;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockWalletValidateAddressAbst.getWalletValidateAddress(
            walletAddress: 'f01234');
        result.fold(
          (fail) {
            testValue = fail;
          },
          (success) {
            testValue = success;
          },
        );
        //Act - Call the function that is to be tested

        final verifyValue =
            await _walletValidateAddressController.getWalletValidateAddress(
          walletAddress: "f01234",
        );
        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
        verify(() => _mockWalletValidateAddressAbst.getWalletValidateAddress(
              walletAddress: "f01234",
            )).called(2);

        verifyNoMoreInteractions(_mockWalletValidateAddressAbst);
      },
    );

    test(
      "the getWalletValidateAddress function's controller should return a bad response in the object Type ('message': 'another error')",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockWalletValidateAddressAbst.getWalletValidateAddress(
              walletAddress: '',
            )).thenAnswer((_) async => const Left(
              {
                "message": "another error",
              },
            ));
        late Map<String, dynamic> testValue;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockWalletValidateAddressAbst.getWalletValidateAddress(
            walletAddress: '');
        result.fold(
          (fail) {
            testValue = fail;
          },
          (success) {
            testValue = success;
          },
        );
        //Act - Call the function that is to be tested

        final verifyValue =
            await _walletValidateAddressController.getWalletValidateAddress(
          walletAddress: "",
        );
        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
        verify(() => _mockWalletValidateAddressAbst.getWalletValidateAddress(
              walletAddress: "",
            )).called(2);

        verifyNoMoreInteractions(_mockWalletValidateAddressAbst);
      },
    );
  });
}
