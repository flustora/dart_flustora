import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_tip_set_by_height_abst.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_tip_set_by_height_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChainGetTipSetByHeightAbst extends Mock
    implements ChainGetTipSetByHeightAbst {}

void main() async {
  late MockChainGetTipSetByHeightAbst _mockChainGetTipSetByHeightAbst;
  late ChainGetTipSetByHeightController _chainGetTipSetByHeightController;

  setUp(() {
    _mockChainGetTipSetByHeightAbst = MockChainGetTipSetByHeightAbst();
    _chainGetTipSetByHeightController = ChainGetTipSetByHeightController(
      chainGetTipSetByHeightAbst: _mockChainGetTipSetByHeightAbst,
    );
  });

  group('ChainGetTipSetByHeightController =>', () {
    // write tests

    test(
      'getChainGetTipSetByHeight of ChainGetTipSetByHeightController should return an Map<String, dynamic> response which be a ("message":"good response")  ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainGetTipSetByHeightAbst.getChainGetTipSetByHeight(
              height: 2479232,
            )).thenAnswer((_) async => const Right(
              {"message": "good response"},
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result =
            await _mockChainGetTipSetByHeightAbst.getChainGetTipSetByHeight(
          height: 2479232,
        );
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable =
            await _chainGetTipSetByHeightController.getChainGetTipSetByHeight(
          height: 2479232,
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetTipSetByHeightAbst.getChainGetTipSetByHeight(
              height: 2479232,
            )).called(2);
        verifyNoMoreInteractions(_mockChainGetTipSetByHeightAbst);
      },
    );

    test(
      'getChainGetTipSetByHeight of ChainGetTipSetByHeightController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainGetTipSetByHeightAbst.getChainGetTipSetByHeight(
              height: 2479232,
            )).thenAnswer((_) async => const Left(
              {
                "message": "You are offline",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result =
            await _mockChainGetTipSetByHeightAbst.getChainGetTipSetByHeight(
          height: 2479232,
        );
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable =
            await _chainGetTipSetByHeightController.getChainGetTipSetByHeight(
          height: 2479232,
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetTipSetByHeightAbst.getChainGetTipSetByHeight(
              height: 2479232,
            )).called(2);
        verifyNoMoreInteractions(_mockChainGetTipSetByHeightAbst);
      },
    );
  });
}
