import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_read_obj_abst.dart';
import 'package:flustora/src/logic/controllers/chain/chain_read_obj_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChainReadObjAbst extends Mock implements ChainReadObjAbst {}

void main() async {
  late MockChainReadObjAbst _mockChainReadObjAbst;
  late ChainReadObjController _chainReadObjController;

  setUp(() {
    _mockChainReadObjAbst = MockChainReadObjAbst();
    _chainReadObjController =
        ChainReadObjController(chainReadObjAbst: _mockChainReadObjAbst);
  });

  group('ChainReadObjController => ', () {
    // write tests

    test(
      'getChainReadObj of ChainReadObjController should return an Map<String, dynamic> response which be a good response ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () => _mockChainReadObjAbst.getChainReadObj(cid: {
                  "/":
                      "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                })).thenAnswer((_) async => const Right(
              {},
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainReadObjAbst.getChainReadObj(cid: {
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

        final verifyVariable = await _chainReadObjController
            .getChainReadObj(cid: {
          "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
        });

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainReadObjAbst.getChainReadObj(cid: {
              "/":
                  "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
            })).called(2);
        verifyNoMoreInteractions(_mockChainReadObjAbst);
      },
    );

    test(
      'getChainReadObj of ChainReadObjController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () => _mockChainReadObjAbst.getChainReadObj(cid: {
                  "/":
                      "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                })).thenAnswer((_) async => const Left(
              {
                "message": "You are offline",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainReadObjAbst.getChainReadObj(cid: {
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

        final verifyVariable = await _chainReadObjController
            .getChainReadObj(cid: {
          "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
        });

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainReadObjAbst.getChainReadObj(cid: {
              "/":
                  "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
            })).called(2);
        verifyNoMoreInteractions(_mockChainReadObjAbst);
      },
    );

    test(
      'getChainReadObj of ChainReadObjController should return an Map<String, dynamic> response which be a bad response ("message": "another error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainReadObjAbst.getChainReadObj(cid: {}))
            .thenAnswer((_) async => const Left(
                  {
                    "message": "another error",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainReadObjAbst.getChainReadObj(cid: {});
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable =
            await _chainReadObjController.getChainReadObj(cid: {});

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainReadObjAbst.getChainReadObj(cid: {})).called(2);
        verifyNoMoreInteractions(_mockChainReadObjAbst);
      },
    );
  });
}
