import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_tip_set_after_height_abst.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_tip_set_after_height_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChainGetTipSetAfterHeightAbst extends Mock
    implements ChainGetTipSetAfterHeightAbst {}

void main() {
  late MockChainGetTipSetAfterHeightAbst _mockChainGetTipSetAfterHeightAbst;
  late ChainGetTipSetAfterHeightController _chainGetTipSetAfterHeightController;

  setUp(() {
    _mockChainGetTipSetAfterHeightAbst = MockChainGetTipSetAfterHeightAbst();
    _chainGetTipSetAfterHeightController = ChainGetTipSetAfterHeightController(
      chainGetTipSetAfterHeightAbst: _mockChainGetTipSetAfterHeightAbst,
    );
  });

  group('ChainGetTipSetAfterHeightController => ', () {
    // write tests
    test(
      'the getChainGetTipSetAfterHeight function of ChainGetTipSetAfterHeightController should return an Map<String, dynamic> response which be a good response',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () =>
                _mockChainGetTipSetAfterHeightAbst.getChainGetTipSetAfterHeight(
                  cid: [
                    {
                      "/":
                          "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                    }
                  ],
                  height: 2479232,
                )).thenAnswer((_) async => const Right(
              {},
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetTipSetAfterHeightAbst
            .getChainGetTipSetAfterHeight(
          cid: [
            {
              "/":
                  "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
            }
          ],
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

        final verifyVariable = await _chainGetTipSetAfterHeightController
            .getChainGetTipSetAfterHeight(
          cid: [
            {
              "/":
                  "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
            }
          ],
          height: 2479232,
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() =>
            _mockChainGetTipSetAfterHeightAbst.getChainGetTipSetAfterHeight(
              cid: [
                {
                  "/":
                      "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                }
              ],
              height: 2479232,
            )).called(2);
        verifyNoMoreInteractions(_mockChainGetTipSetAfterHeightAbst);
      },
    );

    test(
      'the getChainGetTipSetAfterHeight function of ChainGetTipSetAfterHeightController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () =>
                _mockChainGetTipSetAfterHeightAbst.getChainGetTipSetAfterHeight(
                  cid: [
                    {
                      "/":
                          "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                    }
                  ],
                  height: 2479232,
                )).thenAnswer((_) async => const Left(
              {
                "message": "You are offline",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetTipSetAfterHeightAbst
            .getChainGetTipSetAfterHeight(
          cid: [
            {
              "/":
                  "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
            }
          ],
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

        final verifyVariable = await _chainGetTipSetAfterHeightController
            .getChainGetTipSetAfterHeight(
          cid: [
            {
              "/":
                  "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
            }
          ],
          height: 2479232,
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() =>
            _mockChainGetTipSetAfterHeightAbst.getChainGetTipSetAfterHeight(
              cid: [
                {
                  "/":
                      "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                }
              ],
              height: 2479232,
            )).called(2);
        verifyNoMoreInteractions(_mockChainGetTipSetAfterHeightAbst);
      },
    );

    test(
      'the getChainGetTipSetAfterHeight function of ChainGetTipSetAfterHeightController should return an Map<String, dynamic> response which be a bad response ("message": "another error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () =>
                _mockChainGetTipSetAfterHeightAbst.getChainGetTipSetAfterHeight(
                  cid: [{}],
                  height: 2479232,
                )).thenAnswer((_) async => const Left(
              {
                "message": "another error",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetTipSetAfterHeightAbst
            .getChainGetTipSetAfterHeight(
          cid: [{}],
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

        final verifyVariable = await _chainGetTipSetAfterHeightController
            .getChainGetTipSetAfterHeight(
          cid: [{}],
          height: 2479232,
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() =>
            _mockChainGetTipSetAfterHeightAbst.getChainGetTipSetAfterHeight(
              cid: [{}],
              height: 2479232,
            )).called(2);
        verifyNoMoreInteractions(_mockChainGetTipSetAfterHeightAbst);
      },
    );
  });
}
