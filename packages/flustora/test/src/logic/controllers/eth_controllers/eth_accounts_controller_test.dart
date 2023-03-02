import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/eth/eth_accounts_abst.dart';
import 'package:flustora/src/logic/controllers/eth/eth_accounts_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEthAccountsAbst extends Mock implements EthAccountsAbst {}

void main() {
  late MockEthAccountsAbst _mockEthAccountsAbst;
  late EthAccountsController _ethAccountsController;

  setUp(() {
    _mockEthAccountsAbst = MockEthAccountsAbst();
    _ethAccountsController = EthAccountsController(
      ethAccountsAbst: _mockEthAccountsAbst,
    );
  });

  group('EthAccountController => ', () {
    // write tests

    test(
      'getEthAccounts  of EthAccountsController should return an Map<String, dynamic> response which be a response ("message": "good response") ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthAccountsAbst.getEthAccounts())
            .thenAnswer((_) async => const Right(
                  {
                    "message": "good response",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthAccountsAbst.getEthAccounts();
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _ethAccountsController.getEthAccounts();

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthAccountsAbst.getEthAccounts()).called(2);
        verifyNoMoreInteractions(_mockEthAccountsAbst);
      },
    );
    test(
      'getEthAccounts  of EthAccountsController should return an Map<String, dynamic> response which be a good response ("message":"error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthAccountsAbst.getEthAccounts())
            .thenAnswer((_) async => const Left(
                  {
                    "message": "error",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthAccountsAbst.getEthAccounts();
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _ethAccountsController.getEthAccounts();

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthAccountsAbst.getEthAccounts()).called(2);
        verifyNoMoreInteractions(_mockEthAccountsAbst);
      },
    );
  });
}
