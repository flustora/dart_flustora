import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/eth/eth_gas_price_abst.dart';
import 'package:flustora/src/logic/controllers/eth/eth_gas_price_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEthGasPriceAbst extends Mock implements EthGasPriceAbst {}

void main() {
  late MockEthGasPriceAbst _mockEthGasPriceAbst;
  late EthGasPriceController _ethGasPriceController;

  setUp(() {
    _mockEthGasPriceAbst = MockEthGasPriceAbst();
    _ethGasPriceController = EthGasPriceController(
      ethGasPriceAbst: _mockEthGasPriceAbst,
    );
  });

  group('EthGasPriceController => ', () {
    // write tests

    test(
      'getEthGasPrice  of EthGasPriceController should return an Map<String, dynamic> response which be a response ("message": "good response") ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthGasPriceAbst.getEthGasPrice())
            .thenAnswer((_) async => const Right(
                  {
                    "message": "good response",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthGasPriceAbst.getEthGasPrice();
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _ethGasPriceController.getEthGasPrice();

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthGasPriceAbst.getEthGasPrice()).called(2);
        verifyNoMoreInteractions(_mockEthGasPriceAbst);
      },
    );
    test(
      'getEthGasPrice  of EthGasPriceController should return an Map<String, dynamic> response which be a good response ("message":"error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockEthGasPriceAbst.getEthGasPrice())
            .thenAnswer((_) async => const Left(
                  {
                    "message": "error",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockEthGasPriceAbst.getEthGasPrice();
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _ethGasPriceController.getEthGasPrice();

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockEthGasPriceAbst.getEthGasPrice()).called(2);
        verifyNoMoreInteractions(_mockEthGasPriceAbst);
      },
    );
  });
}
