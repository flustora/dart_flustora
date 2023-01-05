import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_has_obj_abst.dart';
import 'package:flustora/src/logic/controllers/chain/chain_has_obj_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChainHasObjAbst extends Mock implements ChainHasObjAbst {}

void main() async {
  late MockChainHasObjAbst _mockChainHasObjAbst;
  late ChainHasObjController _chainHasObjController;

  setUp(() {
    _mockChainHasObjAbst = MockChainHasObjAbst();
    _chainHasObjController = ChainHasObjController(
      chainHasObjAbst: _mockChainHasObjAbst,
    );
  });

  group('ChainHasObjController => ', () {
    // write tests

    test(
      'getChainHasObj of ChainHasObjController should return an Map<String, dynamic> response which be a good response ("message":"good response") ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () => _mockChainHasObjAbst.getChainHasObj(cid: {
                  "/":
                      "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                })).thenAnswer((_) async => const Right(
              {"message": "good response"},
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainHasObjAbst.getChainHasObj(cid: {
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

        final verifyVariable = await _chainHasObjController
            .getChainHasObj(cid: {
          "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
        });

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainHasObjAbst.getChainHasObj(cid: {
              "/":
                  "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
            })).called(2);
        verifyNoMoreInteractions(_mockChainHasObjAbst);
      },
    );

    test(
      'getChainHasObj of ChainHasObjController  should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () => _mockChainHasObjAbst.getChainHasObj(cid: {
                  "/":
                      "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
                })).thenAnswer((_) async => const Left(
              {
                "message": "You are offline",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainHasObjAbst.getChainHasObj(cid: {
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

        final verifyVariable = await _chainHasObjController
            .getChainHasObj(cid: {
          "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
        });

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainHasObjAbst.getChainHasObj(cid: {
              "/":
                  "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
            })).called(2);
        verifyNoMoreInteractions(_mockChainHasObjAbst);
      },
    );

    test(
      'getChainHasObj of ChainHasObjController  should return an Map<String, dynamic> response which be a bad response ("message": "another error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainHasObjAbst.getChainHasObj(cid: {}))
            .thenAnswer((_) async => const Left(
                  {
                    "message": "another error",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainHasObjAbst.getChainHasObj(cid: {});
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable =
            await _chainHasObjController.getChainHasObj(cid: {});

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainHasObjAbst.getChainHasObj(cid: {})).called(2);
        verifyNoMoreInteractions(_mockChainHasObjAbst);
      },
    );
  });
}
