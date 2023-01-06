import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_parent_messages_abst.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_parent_messages_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChainGetParentMessagesAbst extends Mock
    implements ChainGetParentMessagesAbst {}

void main() async {
  late MockChainGetParentMessagesAbst _mockChainGetParentMessagesAbst;
  late ChainGetParentMessagesController _chainGetParentMessagesController;

  setUp(() {
    _mockChainGetParentMessagesAbst = MockChainGetParentMessagesAbst();
    _chainGetParentMessagesController = ChainGetParentMessagesController(
      chainGetParentMessagesAbst: _mockChainGetParentMessagesAbst,
    );
  });

  group('ChainGetParentMessagesController => ', () {
    // write tests

    test(
      'getChainGetParentMessages of ChainGetParentMessagesController should return an Map<String, dynamic> response which be a ("message":"good response")  ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () =>
                _mockChainGetParentMessagesAbst.getChainGetParentMessages(cid: {
                  "/":
                      "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
                })).thenAnswer((_) async => const Right(
              {
                "message": "good response",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetParentMessagesAbst
            .getChainGetParentMessages(cid: {
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

        final verifyVariable = await _chainGetParentMessagesController
            .getChainGetParentMessages(cid: {
          "/": "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
        });

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetParentMessagesAbst.getChainGetParentMessages(
                cid: {
                  "/":
                      "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
                })).called(2);
        verifyNoMoreInteractions(_mockChainGetParentMessagesAbst);
      },
    );

    test(
      'getChainGetParentMessages of ChainGetParentMessagesController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () =>
                _mockChainGetParentMessagesAbst.getChainGetParentMessages(cid: {
                  "/":
                      "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
                })).thenAnswer((_) async => const Left(
              {
                "message": "You are offline",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetParentMessagesAbst
            .getChainGetParentMessages(cid: {
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

        final verifyVariable = await _chainGetParentMessagesController
            .getChainGetParentMessages(cid: {
          "/": "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
        });

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetParentMessagesAbst.getChainGetParentMessages(
                cid: {
                  "/":
                      "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
                })).called(2);
        verifyNoMoreInteractions(_mockChainGetParentMessagesAbst);
      },
    );

    test(
      'getChainGetParentMessages of ChainGetParentMessagesController should return an Map<String, dynamic> response which be a bad response ("message": "another error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainGetParentMessagesAbst
                .getChainGetParentMessages(cid: {}))
            .thenAnswer((_) async => const Left(
                  {
                    "message": "another error",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetParentMessagesAbst
            .getChainGetParentMessages(cid: {});
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _chainGetParentMessagesController
            .getChainGetParentMessages(cid: {});

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetParentMessagesAbst
            .getChainGetParentMessages(cid: {})).called(2);
        verifyNoMoreInteractions(_mockChainGetParentMessagesAbst);
      },
    );
  });
}
