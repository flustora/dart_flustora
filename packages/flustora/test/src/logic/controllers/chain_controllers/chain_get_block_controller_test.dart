import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_block_abst.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_block_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChainGetBlockAbst extends Mock implements ChainGetBlockAbst {}

void main() async {
  late MockChainGetBlockAbst _mockChainGetBlockAbst;
  late ChainGetBlockController _chainGetBlockController;

  setUp(() {
    _mockChainGetBlockAbst = MockChainGetBlockAbst();
    _chainGetBlockController =
        ChainGetBlockController(chainGetBlockAbst: _mockChainGetBlockAbst);
  });

  group('ChainGetBlockController => ', () {
    // write tests

    test(
      'getChainGetBlock of ChainGetBlockController should return an Map<String, dynamic> response which be a ("message":"good response") ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () => _mockChainGetBlockAbst.getChainGetBlock(cid: {
                  "/":
                      "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                })).thenAnswer((_) async => const Right(
              {
                "message": "good response",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetBlockAbst.getChainGetBlock(cid: {
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

        final verifyVariable = await _chainGetBlockController
            .getChainGetBlock(cid: {
          "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
        });

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetBlockAbst.getChainGetBlock(cid: {
              "/":
                  "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
            })).called(2);
        verifyNoMoreInteractions(_mockChainGetBlockAbst);
      },
    );

    test(
      'getChainGetBlock of ChainGetBlockController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () => _mockChainGetBlockAbst.getChainGetBlock(cid: {
                  "/":
                      "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                })).thenAnswer((_) async => const Left(
              {
                "message": "You are offline",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetBlockAbst.getChainGetBlock(cid: {
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

        final verifyVariable = await _chainGetBlockController
            .getChainGetBlock(cid: {
          "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
        });

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetBlockAbst.getChainGetBlock(cid: {
              "/":
                  "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
            })).called(2);
        verifyNoMoreInteractions(_mockChainGetBlockAbst);
      },
    );

    test(
      'getChainGetBlock of ChainGetBlockController should return an Map<String, dynamic> response which be a bad response ("message": "another error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainGetBlockAbst.getChainGetBlock(cid: {}))
            .thenAnswer((_) async => const Left(
                  {
                    "message": "another error",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetBlockAbst.getChainGetBlock(cid: {});
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable =
            await _chainGetBlockController.getChainGetBlock(cid: {});

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetBlockAbst.getChainGetBlock(cid: {}))
            .called(2);
        verifyNoMoreInteractions(_mockChainGetBlockAbst);
      },
    );
  });
}
