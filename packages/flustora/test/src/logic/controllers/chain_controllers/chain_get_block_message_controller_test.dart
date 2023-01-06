import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_block_message_abst.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_block_message_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChainGetBlockMessageAbst extends Mock
    implements ChainGetBlockMessageAbst {}

void main() async {
  late MockChainGetBlockMessageAbst _mockChainGetBlockMessageAbst;
  late ChainGetBlockMessageController _chainGetBlockMessageController;

  setUp(() {
    _mockChainGetBlockMessageAbst = MockChainGetBlockMessageAbst();
    _chainGetBlockMessageController = ChainGetBlockMessageController(
        chainGetBlockMessageAbst: _mockChainGetBlockMessageAbst);
  });

  group('ChainGetBlockMessageController => ', () {
    // write tests

    test(
      'getChainGetBlockMessage of ChainGetBlockMessageController should return an Map<String, dynamic> response which be a ("message":"good response")  ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () => _mockChainGetBlockMessageAbst.getChainGetBlockMessage(cid: {
                  "/":
                      "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                })).thenAnswer((_) async => const Right(
              {
                "message": "good response",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetBlockMessageAbst
            .getChainGetBlockMessage(cid: {
          "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
        });
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _chainGetBlockMessageController
            .getChainGetBlockMessage(cid: {
          "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
        });

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetBlockMessageAbst.getChainGetBlockMessage(
                cid: {
                  "/":
                      "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                })).called(2);
        verifyNoMoreInteractions(_mockChainGetBlockMessageAbst);
      },
    );

    test(
      'getChainGetBlockMessage of ChainGetBlockMessageController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () => _mockChainGetBlockMessageAbst.getChainGetBlockMessage(cid: {
                  "/":
                      "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                })).thenAnswer((_) async => const Left(
              {
                "message": "You are offline",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetBlockMessageAbst
            .getChainGetBlockMessage(cid: {
          "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
        });
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _chainGetBlockMessageController
            .getChainGetBlockMessage(cid: {
          "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
        });

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetBlockMessageAbst.getChainGetBlockMessage(
                cid: {
                  "/":
                      "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                })).called(2);
        verifyNoMoreInteractions(_mockChainGetBlockMessageAbst);
      },
    );

    test(
      'getChainGetBlockMessage of ChainGetBlockMessageController should return an Map<String, dynamic> response which be a bad response ("message": "another error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() =>
                _mockChainGetBlockMessageAbst.getChainGetBlockMessage(cid: {}))
            .thenAnswer((_) async => const Left(
                  {
                    "message": "another error",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetBlockMessageAbst
            .getChainGetBlockMessage(cid: {});
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _chainGetBlockMessageController
            .getChainGetBlockMessage(cid: {});

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() =>
                _mockChainGetBlockMessageAbst.getChainGetBlockMessage(cid: {}))
            .called(2);
        verifyNoMoreInteractions(_mockChainGetBlockMessageAbst);
      },
    );
  });
}
