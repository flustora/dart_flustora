import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/wallet/wallet_balance_abst.dart';
import 'package:flustora/src/logic/controllers/wallet/wallet_balance_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWalletBalanceAbst extends Mock implements WalletBalanceAbst {}

void main() async {
  late MockWalletBalanceAbst _mockWalletBalanceAbst;
  late WalletBalanceController _walletBalanceController;

  setUp(() {
    _mockWalletBalanceAbst = MockWalletBalanceAbst();
    _walletBalanceController = WalletBalanceController(
      walletBalanceAbst: _mockWalletBalanceAbst,
    );
  });

  group('WalletBalanceController => ', () {
    // write tests

    test(
      'getWalletBalance of WalletBalanceController should return an Map<String, dynamic> response which be a good response ("message": "good response",)',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() =>
                _mockWalletBalanceAbst.getWalletBalance(walletAddress: "f01"))
            .thenAnswer((_) async => const Right(
                  {
                    "message": "good response",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result =
            await _mockWalletBalanceAbst.getWalletBalance(walletAddress: "f01");
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _walletBalanceController.getWalletBalance(
            walletAddress: "f01");

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() =>
                _mockWalletBalanceAbst.getWalletBalance(walletAddress: "f01"))
            .called(2);
        verifyNoMoreInteractions(_mockWalletBalanceAbst);
      },
    );

    test(
      'getWalletBalance of WalletBalanceController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockWalletBalanceAbst.getWalletBalance(
              walletAddress: "f01",
            )).thenAnswer((_) async => const Left(
              {
                "message": "You are offline",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockWalletBalanceAbst.getWalletBalance(
          walletAddress: "f01",
        );
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _walletBalanceController.getWalletBalance(
          walletAddress: "f01",
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockWalletBalanceAbst.getWalletBalance(
              walletAddress: "f01",
            )).called(2);
        verifyNoMoreInteractions(_mockWalletBalanceAbst);
      },
    );

    test(
      'getWalletBalance of WalletBalanceController should return an Map<String, dynamic> response which be a bad response ("message": "another error") if the walletAddress variable is empty',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockWalletBalanceAbst.getWalletBalance(walletAddress: ""))
            .thenAnswer((_) async => const Left(
                  {
                    "message": "another error",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockWalletBalanceAbst.getWalletBalance(
          walletAddress: "",
        );
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _walletBalanceController.getWalletBalance(
          walletAddress: "",
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockWalletBalanceAbst.getWalletBalance(
              walletAddress: "",
            )).called(2);
        verifyNoMoreInteractions(_mockWalletBalanceAbst);
      },
    );
  });
}
