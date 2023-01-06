import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_parent_receipts_abst.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_parent_receipts_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChainGetParentReceiptsAbst extends Mock
    implements ChainGetParentReceiptsAbst {}

void main() async {
  late MockChainGetParentReceiptsAbst _mockChainGetParentReceiptsAbst;
  late ChainGetParentReceiptsController _chainGetParentReceiptsController;

  setUp(() {
    _mockChainGetParentReceiptsAbst = MockChainGetParentReceiptsAbst();
    _chainGetParentReceiptsController = ChainGetParentReceiptsController(
      chainGetParentReceiptsAbst: _mockChainGetParentReceiptsAbst,
    );
  });

  group('ChainGetParentReceiptsController => ', () {
    // write tests

    test(
      'getChainGetParentReceipts of ChainGetParentReceiptsController should return an Map<String, dynamic> response which be a ("message":"good response")  ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () =>
                _mockChainGetParentReceiptsAbst.getChainGetParentReceipts(cid: {
                  "/":
                      "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
                })).thenAnswer((_) async => const Right(
              {
                "message": "good response",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetParentReceiptsAbst
            .getChainGetParentReceipts(cid: {
          "/": "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
        });
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _chainGetParentReceiptsController
            .getChainGetParentReceipts(cid: {
          "/": "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
        });

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetParentReceiptsAbst.getChainGetParentReceipts(
                cid: {
                  "/":
                      "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
                })).called(2);
        verifyNoMoreInteractions(_mockChainGetParentReceiptsAbst);
      },
    );

    test(
      'getChainGetParentReceipts of ChainGetParentReceiptsController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () =>
                _mockChainGetParentReceiptsAbst.getChainGetParentReceipts(cid: {
                  "/":
                      "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
                })).thenAnswer((_) async => const Left(
              {
                "message": "You are offline",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetParentReceiptsAbst
            .getChainGetParentReceipts(cid: {
          "/": "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
        });
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _chainGetParentReceiptsController
            .getChainGetParentReceipts(cid: {
          "/": "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
        });

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetParentReceiptsAbst.getChainGetParentReceipts(
                cid: {
                  "/":
                      "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
                })).called(2);
        verifyNoMoreInteractions(_mockChainGetParentReceiptsAbst);
      },
    );

    test(
      'getChainGetParentReceipts of ChainGetParentReceiptsController should return an Map<String, dynamic> response which be a bad response ("message": "another error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainGetParentReceiptsAbst
                .getChainGetParentReceipts(cid: {}))
            .thenAnswer((_) async => const Left(
                  {
                    "message": "another error",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetParentReceiptsAbst
            .getChainGetParentReceipts(cid: {});
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _chainGetParentReceiptsController
            .getChainGetParentReceipts(cid: {});

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetParentReceiptsAbst
            .getChainGetParentReceipts(cid: {})).called(2);
        verifyNoMoreInteractions(_mockChainGetParentReceiptsAbst);
      },
    );
  });
}
