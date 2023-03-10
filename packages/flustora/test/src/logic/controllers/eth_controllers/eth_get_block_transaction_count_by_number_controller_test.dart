import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/eth/eth_get_block_transaction_count_by_number_abst.dart';
import 'package:flustora/src/logic/controllers/eth/eth_get_block_transaction_count_by_number_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEthGetBlockTransactionCountByNumberAbst extends Mock
    implements EthGetBlockTransactionCountByNumberAbst {}

void main() {
  late MockEthGetBlockTransactionCountByNumberAbst
      _mockEthGetBlockTransactionCountByNumberAbst;
  late EthGetBlockTransactionCountByNumberController
      _ethGetBlockTransactionCountByNumberController;

  setUp(() {
    _mockEthGetBlockTransactionCountByNumberAbst =
        MockEthGetBlockTransactionCountByNumberAbst();
    _ethGetBlockTransactionCountByNumberController =
        EthGetBlockTransactionCountByNumberController(
      ethGetBlockTransactionCountByNumberAbst:
          _mockEthGetBlockTransactionCountByNumberAbst,
    );
  });

  group('EthGetBlockTransactionCountByNumberController => ', () {
    // write tests

    test(
      'getEthGetBlockTransactionCountByNumber  of EthGetBlockTransactionCountByNumberController should return an Map<String, dynamic> response which be a response ("message": "good response") ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthGetBlockTransactionCountByNumberAbst
                .getEthGetBlockTransactionCountByNumber(numberBlock: '0x51'))
            .thenAnswer((_) async => const Right(
                  {
                    "message": "good response",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthGetBlockTransactionCountByNumberAbst
            .getEthGetBlockTransactionCountByNumber(numberBlock: '0x51');
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable =
            await _ethGetBlockTransactionCountByNumberController
                .getEthGetBlockTransactionCountByNumber(numberBlock: '0x51');

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthGetBlockTransactionCountByNumberAbst
                .getEthGetBlockTransactionCountByNumber(numberBlock: '0x51'))
            .called(2);
        verifyNoMoreInteractions(_mockEthGetBlockTransactionCountByNumberAbst);
      },
    );

    test(
      'getEthGetBlockTransactionCountByNumber  of EthGetBlockTransactionCountByNumberController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthGetBlockTransactionCountByNumberAbst
                .getEthGetBlockTransactionCountByNumber(numberBlock: '0x51'))
            .thenAnswer((_) async => const Left(
                  {
                    "message": "You are offline",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthGetBlockTransactionCountByNumberAbst
            .getEthGetBlockTransactionCountByNumber(numberBlock: '0x51');
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable =
            await _ethGetBlockTransactionCountByNumberController
                .getEthGetBlockTransactionCountByNumber(numberBlock: '0x51');

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthGetBlockTransactionCountByNumberAbst
                .getEthGetBlockTransactionCountByNumber(numberBlock: '0x51'))
            .called(2);
        verifyNoMoreInteractions(_mockEthGetBlockTransactionCountByNumberAbst);
      },
    );

    test(
      'getEthGetBlockTransactionCountByNumber  of EthGetBlockTransactionCountByNumberController should return an Map<String, dynamic> response which be a bad response ("message": "another error") if the AccountAddress variable is empty',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthGetBlockTransactionCountByNumberAbst
                .getEthGetBlockTransactionCountByNumber(numberBlock: ''))
            .thenAnswer((_) async => const Left(
                  {
                    "message": "another error",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthGetBlockTransactionCountByNumberAbst
            .getEthGetBlockTransactionCountByNumber(numberBlock: '');
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable =
            await _ethGetBlockTransactionCountByNumberController
                .getEthGetBlockTransactionCountByNumber(numberBlock: '');

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthGetBlockTransactionCountByNumberAbst
            .getEthGetBlockTransactionCountByNumber(numberBlock: '')).called(2);
        verifyNoMoreInteractions(_mockEthGetBlockTransactionCountByNumberAbst);
      },
    );
  });
}
