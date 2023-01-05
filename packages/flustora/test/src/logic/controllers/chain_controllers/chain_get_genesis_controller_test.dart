import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_genesis_abst.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_genesis_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChainGetGenesisAbst extends Mock implements ChainGetGenesisAbst {}

void main() async {
  late MockChainGetGenesisAbst _mockChainGetGenesisAbst;
  late ChainGetGenesisController _chainGetGenesisController;

  setUp(() {
    _mockChainGetGenesisAbst = MockChainGetGenesisAbst();
    _chainGetGenesisController = ChainGetGenesisController(
      chainGetGenesisAbst: _mockChainGetGenesisAbst,
    );
  });

  group('ChainGetGenesisController =>', () {
    // write tests

    test(
      'getChainGetGenesis of ChainGetGenesisController should return an Map<String, dynamic> response which be a ("message":"good response")  ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainGetGenesisAbst.getChainGetGenesis())
            .thenAnswer((_) async => const Right(
                  {
                    "message": "good response",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetGenesisAbst.getChainGetGenesis();
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable =
            await _chainGetGenesisController.getChainGetGenesis();

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetGenesisAbst.getChainGetGenesis()).called(2);
        verifyNoMoreInteractions(_mockChainGetGenesisAbst);
      },
    );

    test(
      'getChainGetGenesis of ChainGetGenesisController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainGetGenesisAbst.getChainGetGenesis())
            .thenAnswer((_) async => const Left(
                  {
                    "message": "You are offline",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetGenesisAbst.getChainGetGenesis();
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable =
            await _chainGetGenesisController.getChainGetGenesis();

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetGenesisAbst.getChainGetGenesis()).called(2);
        verifyNoMoreInteractions(_mockChainGetGenesisAbst);
      },
    );
  });
}
