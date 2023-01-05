import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/wallet/wallet_verify_abst.dart';
import 'package:flustora/src/logic/controllers/wallet/wallet_verify_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWalletVerifyAbst extends Mock implements WalletVerifyAbst {}

void main() {
  late MockWalletVerifyAbst _mockWalletVerifyAbst;
  late WalletVerifyController _walletVerifyController;
  setUp(() {
    _mockWalletVerifyAbst = MockWalletVerifyAbst();
    _walletVerifyController = WalletVerifyController(
      walletVerifyAbst: _mockWalletVerifyAbst,
    );
  });

  group('WalletVerifyController =>', () {
    // write tests

    test(
      "the getWalletVerify function's controller should return a good response ('message':'good response') in the object Type",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockWalletVerifyAbst.getWalletVerify(
                walletAddress: 'f01234', signature: "Ynl0ZSBhcnJheD=="))
            .thenAnswer((_) async => const Right(
                  {
                    "message": "good response",
                  },
                ));
        late Map<String, dynamic> testValue;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockWalletVerifyAbst.getWalletVerify(
          walletAddress: 'f01234',
          signature: "Ynl0ZSBhcnJheD==",
        );
        result.fold(
          (fail) {
            testValue = fail;
          },
          (success) {
            testValue = success;
          },
        );
        //Act - Call the function that is to be tested

        final verifyValue = await _walletVerifyController.getWalletVerify(
          walletAddress: 'f01234',
          signature: "Ynl0ZSBhcnJheD==",
        );
        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
        verify(() => _mockWalletVerifyAbst.getWalletVerify(
              walletAddress: 'f01234',
              signature: "Ynl0ZSBhcnJheD==",
            )).called(2);

        verifyNoMoreInteractions(_mockWalletVerifyAbst);
      },
    );

    test(
      "the getWalletVerify function's controller should return bad response in the object Type ('message': 'you are offline',) ",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockWalletVerifyAbst.getWalletVerify(
              walletAddress: 'f01234',
              signature: "Ynl0ZSBhcnJhed==",
            )).thenAnswer((_) async => const Left(
              {
                "message": "you are offline",
              },
            ));
        late Map<String, dynamic> testValue;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockWalletVerifyAbst.getWalletVerify(
          walletAddress: 'f01234',
          signature: "Ynl0ZSBhcnJhed==",
        );
        result.fold(
          (fail) {
            testValue = fail;
          },
          (success) {
            testValue = success;
          },
        );
        //Act - Call the function that is to be tested

        final verifyValue = await _walletVerifyController.getWalletVerify(
          walletAddress: 'f01234',
          signature: "Ynl0ZSBhcnJhed==",
        );
        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
        verify(() => _mockWalletVerifyAbst.getWalletVerify(
              walletAddress: 'f01234',
              signature: "Ynl0ZSBhcnJhed==",
            )).called(2);

        verifyNoMoreInteractions(_mockWalletVerifyAbst);
      },
    );

    test(
      "the getWalletVerify function's controller should return a bad response in the object Type ('message': 'good response',) if the all the variable are empty",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockWalletVerifyAbst.getWalletVerify(
                walletAddress: "", signature: ""))
            .thenAnswer((_) async => const Left(
                  {},
                ));
        late Map<String, dynamic> testValue;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockWalletVerifyAbst.getWalletVerify(
          walletAddress: "",
          signature: "",
        );
        result.fold(
          (fail) {
            testValue = fail;
          },
          (success) {
            testValue = success;
          },
        );
        //Act - Call the function that is to be tested

        final verifyValue = await _walletVerifyController.getWalletVerify(
          walletAddress: "",
          signature: "",
        );
        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
        verify(() => _mockWalletVerifyAbst.getWalletVerify(
              walletAddress: "",
              signature: "",
            )).called(2);

        verifyNoMoreInteractions(_mockWalletVerifyAbst);
      },
    );
  });
}
