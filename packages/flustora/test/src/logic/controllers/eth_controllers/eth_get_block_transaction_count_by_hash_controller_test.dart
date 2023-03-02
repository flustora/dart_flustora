import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/eth/eth_get_block_transaction_count_by_hash_abst.dart';
import 'package:flustora/src/logic/controllers/eth/eth_get_block_transaction_count_by_hash_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEthGetBlockTransactionCountByHashAbst extends Mock
    implements EthGetBlockTransactionCountByHashAbst {}

void main() {
  late MockEthGetBlockTransactionCountByHashAbst
      _mockEthGetBlockTransactionCountByHashAbst;
  late EthGetBlockTransactionCountByHashController
      _ethGetBlockTransactionCountByHashController;

  setUp(() {
    _mockEthGetBlockTransactionCountByHashAbst =
        MockEthGetBlockTransactionCountByHashAbst();
    _ethGetBlockTransactionCountByHashController =
        EthGetBlockTransactionCountByHashController(
      ethGetBlockTransactionCountByHashAbst:
          _mockEthGetBlockTransactionCountByHashAbst,
    );
  });

  group('EthGetBlockTransactionCountByHashController => ', () {
    // write tests

    test(
      'getEthGetBlockTransactionCountByHash  of EthGetBlockTransactionCountByHashController should return an Map<String, dynamic> response which be a response ("message": "good response") ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthGetBlockTransactionCountByHashAbst
                .getEthGetBlockTransactionCountByHash(
                    hashBlock:
                        '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64'))
            .thenAnswer((_) async => const Right(
                  {
                    "message": "good response",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthGetBlockTransactionCountByHashAbst
            .getEthGetBlockTransactionCountByHash(
                hashBlock:
                    '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64');
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _ethGetBlockTransactionCountByHashController
            .getEthGetBlockTransactionCountByHash(
                hashBlock:
                    '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64');

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthGetBlockTransactionCountByHashAbst
                .getEthGetBlockTransactionCountByHash(
                    hashBlock:
                        '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64'))
            .called(2);
        verifyNoMoreInteractions(_mockEthGetBlockTransactionCountByHashAbst);
      },
    );

    test(
      'getEthGetBlockTransactionCountByHash  of EthGetBlockTransactionCountByHashController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthGetBlockTransactionCountByHashAbst
                .getEthGetBlockTransactionCountByHash(
                    hashBlock:
                        '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64'))
            .thenAnswer((_) async => const Right(
                  {
                    "message": "You are offline",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthGetBlockTransactionCountByHashAbst
            .getEthGetBlockTransactionCountByHash(
                hashBlock:
                    '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64');
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _ethGetBlockTransactionCountByHashController
            .getEthGetBlockTransactionCountByHash(
                hashBlock:
                    '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64');

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthGetBlockTransactionCountByHashAbst
                .getEthGetBlockTransactionCountByHash(
                    hashBlock:
                        '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64'))
            .called(2);
        verifyNoMoreInteractions(_mockEthGetBlockTransactionCountByHashAbst);
      },
    );

    test(
      'getEthGetBlockTransactionCountByHash  of EthGetBlockTransactionCountByHashController should return an Map<String, dynamic> response which be a bad response ("message": "another error") if the AccountAddress variable is empty',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthGetBlockTransactionCountByHashAbst
                .getEthGetBlockTransactionCountByHash(hashBlock: ''))
            .thenAnswer((_) async => const Left(
                  {
                    "message": "another error",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthGetBlockTransactionCountByHashAbst
            .getEthGetBlockTransactionCountByHash(hashBlock: '');
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable =
            await _ethGetBlockTransactionCountByHashController
                .getEthGetBlockTransactionCountByHash(hashBlock: '');

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthGetBlockTransactionCountByHashAbst
            .getEthGetBlockTransactionCountByHash(hashBlock: '')).called(2);
        verifyNoMoreInteractions(_mockEthGetBlockTransactionCountByHashAbst);
      },
    );
  });
}
