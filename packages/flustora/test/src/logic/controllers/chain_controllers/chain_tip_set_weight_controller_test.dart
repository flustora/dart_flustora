import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_tip_set_weight_abst.dart';
import 'package:flustora/src/logic/controllers/chain/chain_tip_set_weight_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChainTipSetWeightAbst extends Mock implements ChainTipSetWeightAbst {}

void main() {
  late MockChainTipSetWeightAbst _mockChainTipSetWeightAbst;
  late ChainTipSetWeightController _chainTipSetWeightController;
  setUp(() {
    _mockChainTipSetWeightAbst = MockChainTipSetWeightAbst();
    _chainTipSetWeightController = ChainTipSetWeightController(
      chainTipSetWeightAbst: _mockChainTipSetWeightAbst,
    );
  });

  group('ChainTipSetWeightController => ', () {
    // write tests
    test(
      'the getChainTipSetWeight function of ChainTipSetWeightController should should return an Map<String, dynamic> response which be a good response',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainTipSetWeightAbst.getChainTipSetWeight(
              tipSetKey: [
                {
                  "/":
                      "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
                }
              ],
            )).thenAnswer((_) async => const Right(
              {
                "message": "good response",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainTipSetWeightAbst.getChainTipSetWeight(
          tipSetKey: [
            {
              "/":
                  "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
            }
          ],
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
            await _chainTipSetWeightController.getChainTipSetWeight(
          tipSetKey: [
            {
              "/":
                  "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
            }
          ],
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainTipSetWeightAbst.getChainTipSetWeight(
              tipSetKey: [
                {
                  "/":
                      "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
                }
              ],
            )).called(2);
        verifyNoMoreInteractions(_mockChainTipSetWeightAbst);
      },
    );

    test(
      'getChainTipSetWeight of ChainTipSetWeightController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainTipSetWeightAbst.getChainTipSetWeight(
              tipSetKey: [
                {
                  "/":
                      "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
                }
              ],
            )).thenAnswer((_) async => const Left(
              {
                "message": "You are offline",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainTipSetWeightAbst.getChainTipSetWeight(
          tipSetKey: [
            {
              "/":
                  "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
            }
          ],
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
            await _chainTipSetWeightController.getChainTipSetWeight(
          tipSetKey: [
            {
              "/":
                  "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
            }
          ],
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainTipSetWeightAbst.getChainTipSetWeight(
              tipSetKey: [
                {
                  "/":
                      "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
                }
              ],
            )).called(2);
        verifyNoMoreInteractions(_mockChainTipSetWeightAbst);
      },
    );

    test(
      'getChainTipSetWeight of ChainTipSetWeightController  should return an Map<String, dynamic> response which be a bad response ("message": "another error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainTipSetWeightAbst.getChainTipSetWeight(
              tipSetKey: [{}],
            )).thenAnswer((_) async => const Left(
              {
                "message": "another error",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainTipSetWeightAbst.getChainTipSetWeight(
          tipSetKey: [{}],
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
            await _chainTipSetWeightController.getChainTipSetWeight(
          tipSetKey: [{}],
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainTipSetWeightAbst.getChainTipSetWeight(
              tipSetKey: [{}],
            )).called(2);
        verifyNoMoreInteractions(_mockChainTipSetWeightAbst);
      },
    );
  });
}
