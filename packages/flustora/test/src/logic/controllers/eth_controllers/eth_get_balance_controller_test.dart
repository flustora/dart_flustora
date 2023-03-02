import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/eth/eth_get_balance_abst.dart';
import 'package:flustora/src/logic/controllers/eth/eth_get_balance_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEthGetBalanceAbst extends Mock implements EthGetBalanceAbst {}

void main() {
  late MockEthGetBalanceAbst _mockEthGetBalanceAbst;
  late EthGetBalanceController _ethGetBalanceController;

  setUp(() {
    _mockEthGetBalanceAbst = MockEthGetBalanceAbst();
    _ethGetBalanceController = EthGetBalanceController(
      ethGetBalanceAbst: _mockEthGetBalanceAbst,
    );
  });

  group('EthGetBalanceController => ', () {
    // write tests

    test(
      'getEthGetBalance  of EthGetBalanceController should return an Map<String, dynamic> response which be a response ("message": "good response") ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthGetBalanceAbst.getEthGetBalance(
                accountAddress: '0x3e1F70090cf4476d788C5259F50F89E9fB88bF1a'))
            .thenAnswer((_) async => const Right(
                  {
                    "message": "good response",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthGetBalanceAbst.getEthGetBalance(
            accountAddress: '0x3e1F70090cf4476d788C5259F50F89E9fB88bF1a');
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _ethGetBalanceController.getEthGetBalance(
            accountAddress: '0x3e1F70090cf4476d788C5259F50F89E9fB88bF1a');

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthGetBalanceAbst.getEthGetBalance(
                accountAddress: '0x3e1F70090cf4476d788C5259F50F89E9fB88bF1a'))
            .called(2);
        verifyNoMoreInteractions(_mockEthGetBalanceAbst);
      },
    );

    test(
      'getEthGetBalance  of EthGetBalanceController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthGetBalanceAbst.getEthGetBalance(
                accountAddress: '0x3e1F70090cf4476d788C5259F50F89E9fB88bF1a'))
            .thenAnswer((_) async => const Right(
                  {
                    "message": "You are offline",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthGetBalanceAbst.getEthGetBalance(
            accountAddress: '0x3e1F70090cf4476d788C5259F50F89E9fB88bF1a');
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _ethGetBalanceController.getEthGetBalance(
            accountAddress: '0x3e1F70090cf4476d788C5259F50F89E9fB88bF1a');

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthGetBalanceAbst.getEthGetBalance(
                accountAddress: '0x3e1F70090cf4476d788C5259F50F89E9fB88bF1a'))
            .called(2);
        verifyNoMoreInteractions(_mockEthGetBalanceAbst);
      },
    );

    test(
      'getEthGetBalance  of EthGetBalanceController should return an Map<String, dynamic> response which be a bad response ("message": "another error") if the AccountAddress variable is empty',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthGetBalanceAbst.getEthGetBalance(accountAddress: ''))
            .thenAnswer((_) async => const Left(
                  {
                    "message": "another error",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result =
            await _mockEthGetBalanceAbst.getEthGetBalance(accountAddress: '');
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable =
            await _ethGetBalanceController.getEthGetBalance(accountAddress: '');

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() =>
                _mockEthGetBalanceAbst.getEthGetBalance(accountAddress: ''))
            .called(2);
        verifyNoMoreInteractions(_mockEthGetBalanceAbst);
      },
    );
  });
}
