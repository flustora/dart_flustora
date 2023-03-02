import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/eth/eth_chain_id_abst.dart';
import 'package:flustora/src/logic/controllers/eth/eth_chain_id_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEthChainIdAbst extends Mock implements EthChainIdAbst {}

void main() {
  late MockEthChainIdAbst _mockEthChainIdAbst;
  late EthChainIdController _ethChainIdController;

  setUp(() {
    _mockEthChainIdAbst = MockEthChainIdAbst();
    _ethChainIdController = EthChainIdController(
      ethChainIdAbst: _mockEthChainIdAbst,
    );
  });

  group('EthChainIdController => ', () {
    // write tests

    test(
      'getEthChainId  of EthChainIdController should return an Map<String, dynamic> response which be a response ("message": "good response") ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthChainIdAbst.getEthChainId())
            .thenAnswer((_) async => const Right(
                  {
                    "message": "good response",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthChainIdAbst.getEthChainId();
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _ethChainIdController.getEthChainId();

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthChainIdAbst.getEthChainId()).called(2);
        verifyNoMoreInteractions(_mockEthChainIdAbst);
      },
    );
    test(
      'getEthChainId  of EthChainIdController should return an Map<String, dynamic> response which be a good response ("message":"error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthChainIdAbst.getEthChainId())
            .thenAnswer((_) async => const Left(
                  {
                    "message": "error",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthChainIdAbst.getEthChainId();
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _ethChainIdController.getEthChainId();

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthChainIdAbst.getEthChainId()).called(2);
        verifyNoMoreInteractions(_mockEthChainIdAbst);
      },
    );
  });
}
