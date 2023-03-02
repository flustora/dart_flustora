import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/eth/eth_get_block_by_hash_abst.dart';
import 'package:flustora/src/logic/controllers/eth/eth_get_block_by_hash_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEthGetBlockByHashAbst extends Mock implements EthGetBlockByHashAbst {}

void main() {
  late MockEthGetBlockByHashAbst _mockEthGetBlockByHashAbst;
  late EthGetBlockByHashController _ethGetBlockByHashController;

  setUp(() {
    _mockEthGetBlockByHashAbst = MockEthGetBlockByHashAbst();
    _ethGetBlockByHashController = EthGetBlockByHashController(
      ethGetBlockByHashAbst: _mockEthGetBlockByHashAbst,
    );
  });

  group('EthGetBlockByHashController => ', () {
    // write tests

    test(
      'getEthGetBlockByHash  of EthGetBlockByHashController should return an Map<String, dynamic> response which be a response ("message": "good response") ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthGetBlockByHashAbst.getEthGetBlockByHash(
                tipsetBlock:
                    '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64'))
            .thenAnswer((_) async => const Right(
                  {
                    "message": "good response",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthGetBlockByHashAbst.getEthGetBlockByHash(
            tipsetBlock:
                '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64');
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable =
            await _ethGetBlockByHashController.getEthGetBlockByHash(
                tipsetBlock:
                    '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64');

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthGetBlockByHashAbst.getEthGetBlockByHash(
                tipsetBlock:
                    '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64'))
            .called(2);
        verifyNoMoreInteractions(_mockEthGetBlockByHashAbst);
      },
    );

    test(
      'getEthGetBlockByHash  of EthGetBlockByHashController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthGetBlockByHashAbst.getEthGetBlockByHash(
                tipsetBlock:
                    '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64'))
            .thenAnswer((_) async => const Right(
                  {
                    "message": "You are offline",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthGetBlockByHashAbst.getEthGetBlockByHash(
            tipsetBlock:
                '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64');
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable =
            await _ethGetBlockByHashController.getEthGetBlockByHash(
                tipsetBlock:
                    '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64');

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthGetBlockByHashAbst.getEthGetBlockByHash(
                tipsetBlock:
                    '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64'))
            .called(2);
        verifyNoMoreInteractions(_mockEthGetBlockByHashAbst);
      },
    );

    test(
      'getEthGetBlockByHash  of EthGetBlockByHashController should return an Map<String, dynamic> response which be a bad response ("message": "another error") if the AccountAddress variable is empty',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthGetBlockByHashAbst
                .getEthGetBlockByHash(tipsetBlock: ''))
            .thenAnswer((_) async => const Left(
                  {
                    "message": "another error",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthGetBlockByHashAbst.getEthGetBlockByHash(
            tipsetBlock: '');
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _ethGetBlockByHashController
            .getEthGetBlockByHash(tipsetBlock: '');

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthGetBlockByHashAbst.getEthGetBlockByHash(
            tipsetBlock: '')).called(2);
        verifyNoMoreInteractions(_mockEthGetBlockByHashAbst);
      },
    );
  });
}
