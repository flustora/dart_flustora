import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_tip_set_abst.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_tip_set_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChainGetTipSetAbst extends Mock implements ChainGetTipSetAbst {}

void main() {
  late MockChainGetTipSetAbst _mockChainGetTipSetAbst;
  late ChainGetTipSetController _chainGetTipSetController;
  setUp(() {
    _mockChainGetTipSetAbst = MockChainGetTipSetAbst();
    _chainGetTipSetController =
        ChainGetTipSetController(chainGetTipSetAbst: _mockChainGetTipSetAbst);
  });

  group('ChainGetTipSetController => ', () {
    // write tests
    test(
      'the getChainGetTipSet function of ChainGetTipSetController should should return an Map<String, dynamic> response which be a good response',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainGetTipSetAbst.getChainGetTipSet(
              tipSetKey: [
                {
                  "/":
                      "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                }
              ],
            )).thenAnswer((_) async => const Right(
              {
                "message": "good response",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetTipSetAbst.getChainGetTipSet(
          tipSetKey: [
            {
              "/":
                  "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
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
            await _chainGetTipSetController.getChainGetTipSet(
          tipSetKey: [
            {
              "/":
                  "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
            }
          ],
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetTipSetAbst.getChainGetTipSet(
              tipSetKey: [
                {
                  "/":
                      "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                }
              ],
            )).called(2);
        verifyNoMoreInteractions(_mockChainGetTipSetAbst);
      },
    );

    test(
      'getChainGetTipSet of ChainGetTipSetController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainGetTipSetAbst.getChainGetTipSet(
              tipSetKey: [
                {
                  "/":
                      "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                }
              ],
            )).thenAnswer((_) async => const Left(
              {
                "message": "You are offline",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetTipSetAbst.getChainGetTipSet(
          tipSetKey: [
            {
              "/":
                  "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
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
            await _chainGetTipSetController.getChainGetTipSet(
          tipSetKey: [
            {
              "/":
                  "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
            }
          ],
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetTipSetAbst.getChainGetTipSet(
              tipSetKey: [
                {
                  "/":
                      "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                }
              ],
            )).called(2);
        verifyNoMoreInteractions(_mockChainGetTipSetAbst);
      },
    );

    test(
      'getChainGetTipSet of ChainGetTipSetController should return an Map<String, dynamic> response which be a bad response ("message": "another error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainGetTipSetAbst.getChainGetTipSet(
              tipSetKey: [{}],
            )).thenAnswer((_) async => const Left(
              {
                "message": "another error",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetTipSetAbst.getChainGetTipSet(
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
            await _chainGetTipSetController.getChainGetTipSet(
          tipSetKey: [{}],
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetTipSetAbst.getChainGetTipSet(
              tipSetKey: [{}],
            )).called(2);
        verifyNoMoreInteractions(_mockChainGetTipSetAbst);
      },
    );
  });
}
