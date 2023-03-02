import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/eth/eth_block_number_abst.dart';
import 'package:flustora/src/logic/controllers/eth/eth_block_number_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEthBlockNumberAbst extends Mock implements EthBlockNumberAbst {}

void main() {
  late MockEthBlockNumberAbst _mockEthBlockNumberAbst;
  late EthBlockNumberController _ethBlockNumberController;

  setUp(() {
    _mockEthBlockNumberAbst = MockEthBlockNumberAbst();
    _ethBlockNumberController = EthBlockNumberController(
      ethBlockNumberAbst: _mockEthBlockNumberAbst,
    );
  });

  group('EthBlockNumberController => ', () {
    // write tests

    test(
      'getEthBlockNumber  of EthBlockNumberController should return an Map<String, dynamic> response which be a response ("message": "good response") ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthBlockNumberAbst.getEthBlockNumber())
            .thenAnswer((_) async => const Right(
                  {
                    "message": "good response",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthBlockNumberAbst.getEthBlockNumber();
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable =
            await _ethBlockNumberController.getEthBlockNumber();

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthBlockNumberAbst.getEthBlockNumber()).called(2);
        verifyNoMoreInteractions(_mockEthBlockNumberAbst);
      },
    );
    test(
      'getEthBlockNumber  of EthBlockNumberController should return an Map<String, dynamic> response which be a good response ("message":"error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthBlockNumberAbst.getEthBlockNumber())
            .thenAnswer((_) async => const Left(
                  {
                    "message": "error",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthBlockNumberAbst.getEthBlockNumber();
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable =
            await _ethBlockNumberController.getEthBlockNumber();

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthBlockNumberAbst.getEthBlockNumber()).called(2);
        verifyNoMoreInteractions(_mockEthBlockNumberAbst);
      },
    );
  });
}
