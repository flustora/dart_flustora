import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/eth/eth_get_block_by_number_abst.dart';
import 'package:flustora/src/logic/controllers/eth/eth_get_block_by_number_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEthGetBlockByNumberAbst extends Mock
    implements EthGetBlockByNumberAbst {}

void main() {
  late MockEthGetBlockByNumberAbst _mockEthGetBlockByNumberAbst;
  late EthGetBlockByNumberController _ethGetBlockByNumberController;

  setUp(() {
    _mockEthGetBlockByNumberAbst = MockEthGetBlockByNumberAbst();
    _ethGetBlockByNumberController = EthGetBlockByNumberController(
      ethGetBlockByNumberAbst: _mockEthGetBlockByNumberAbst,
    );
  });

  group('EthGetBlockByNumberController => ', () {
    // write tests

    test(
      'getEthGetBlockByNumber  of EthGetBlockByNumberController should return an Map<String, dynamic> response which be a response ("message": "good response") ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthGetBlockByNumberAbst
                .getEthGetBlockByNumber(numberBlock: '0x82c9'))
            .thenAnswer((_) async => const Right(
                  {
                    "message": "good response",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthGetBlockByNumberAbst.getEthGetBlockByNumber(
            numberBlock: '0x82c9');
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _ethGetBlockByNumberController
            .getEthGetBlockByNumber(numberBlock: '0x82c9');

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthGetBlockByNumberAbst.getEthGetBlockByNumber(
            numberBlock: '0x82c9')).called(2);
        verifyNoMoreInteractions(_mockEthGetBlockByNumberAbst);
      },
    );

    test(
      'getEthGetBlockByNumber  of EthGetBlockByNumberController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthGetBlockByNumberAbst
                .getEthGetBlockByNumber(numberBlock: '0x82c9'))
            .thenAnswer((_) async => const Right(
                  {
                    "message": "You are offline",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthGetBlockByNumberAbst.getEthGetBlockByNumber(
            numberBlock: '0x82c9');
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _ethGetBlockByNumberController
            .getEthGetBlockByNumber(numberBlock: '0x82c9');

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthGetBlockByNumberAbst.getEthGetBlockByNumber(
            numberBlock: '0x82c9')).called(2);
        verifyNoMoreInteractions(_mockEthGetBlockByNumberAbst);
      },
    );

    test(
      'getEthGetBlockByNumber  of EthGetBlockByNumberController should return an Map<String, dynamic> response which be a bad response ("message": "another error") if the AccountAddress variable is empty',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthGetBlockByNumberAbst
                .getEthGetBlockByNumber(numberBlock: ''))
            .thenAnswer((_) async => const Left(
                  {
                    "message": "another error",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthGetBlockByNumberAbst.getEthGetBlockByNumber(
            numberBlock: '');
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _ethGetBlockByNumberController
            .getEthGetBlockByNumber(numberBlock: '');

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthGetBlockByNumberAbst.getEthGetBlockByNumber(
            numberBlock: '')).called(2);
        verifyNoMoreInteractions(_mockEthGetBlockByNumberAbst);
      },
    );
  });
}
