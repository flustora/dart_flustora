import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_head_abst.dart';
import 'package:flustora/src/logic/controllers/chain/chain_head_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChainHeadAbst extends Mock implements ChainHeadAbst {}

void main() async {
  late MockChainHeadAbst _mockChainHeadAbst;
  late ChainHeadController _chainHeadController;

  setUp(() {
    _mockChainHeadAbst = MockChainHeadAbst();
    _chainHeadController = ChainHeadController(
      chainHeadAbst: _mockChainHeadAbst,
    );
  });

  group('ChainHeadController => ', () {
    // write tests

    test(
      'getChainHead of ChainHeadController should return an Map<String, dynamic> response which be a good response ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainHeadAbst.getChainHead())
            .thenAnswer((_) async => const Right(
                  {},
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainHeadAbst.getChainHead();
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _chainHeadController.getChainHead();

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainHeadAbst.getChainHead()).called(2);
        verifyNoMoreInteractions(_mockChainHeadAbst);
      },
    );

    test(
      'getChainHead of ChainHeadController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainHeadAbst.getChainHead())
            .thenAnswer((_) async => const Left(
                  {
                    "message": "You are offline",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainHeadAbst.getChainHead();
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _chainHeadController.getChainHead();

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainHeadAbst.getChainHead()).called(2);
        verifyNoMoreInteractions(_mockChainHeadAbst);
      },
    );
  });
}
