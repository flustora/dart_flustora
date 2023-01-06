import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_messages_in_tipset_abst.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_messages_in_tipset_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChainGetMessagesInTipsetAbst extends Mock
    implements ChainGetMessagesInTipsetAbst {}

void main() {
  late MockChainGetMessagesInTipsetAbst _mockChainGetMessagesInTipsetAbst;
  late ChainGetMessagesInTipsetController _chainGetMessagesInTipsetController;
  setUp(() {
    _mockChainGetMessagesInTipsetAbst = MockChainGetMessagesInTipsetAbst();
    _chainGetMessagesInTipsetController = ChainGetMessagesInTipsetController(
      chainGetMessagesInTipsetAbst: _mockChainGetMessagesInTipsetAbst,
    );
  });

  group('ChainGetMessagesInTipsetController => ', () {
    // write tests
    test(
      'the getChainGetMessagesInTipset function of ChainGetMessagesInTipsetController should should return an Map<String, dynamic> response which be a good response',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () => _mockChainGetMessagesInTipsetAbst.getChainGetMessagesInTipset(
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
        result =
            await _mockChainGetMessagesInTipsetAbst.getChainGetMessagesInTipset(
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

        final verifyVariable = await _chainGetMessagesInTipsetController
            .getChainGetMessagesInTipset(
          tipSetKey: [
            {
              "/":
                  "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
            }
          ],
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(
            () => _mockChainGetMessagesInTipsetAbst.getChainGetMessagesInTipset(
                  tipSetKey: [
                    {
                      "/":
                          "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
                    }
                  ],
                )).called(2);
        verifyNoMoreInteractions(_mockChainGetMessagesInTipsetAbst);
      },
    );

    test(
      'getChainGetMessagesInTipset of ChainGetMessagesInTipsetController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () => _mockChainGetMessagesInTipsetAbst.getChainGetMessagesInTipset(
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
        result =
            await _mockChainGetMessagesInTipsetAbst.getChainGetMessagesInTipset(
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

        final verifyVariable = await _chainGetMessagesInTipsetController
            .getChainGetMessagesInTipset(
          tipSetKey: [
            {
              "/":
                  "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
            }
          ],
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(
            () => _mockChainGetMessagesInTipsetAbst.getChainGetMessagesInTipset(
                  tipSetKey: [
                    {
                      "/":
                          "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
                    }
                  ],
                )).called(2);
        verifyNoMoreInteractions(_mockChainGetMessagesInTipsetAbst);
      },
    );

    test(
      'getChainGetMessagesInTipset of ChainGetMessagesInTipsetController  should return an Map<String, dynamic> response which be a bad response ("message": "another error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () => _mockChainGetMessagesInTipsetAbst.getChainGetMessagesInTipset(
                  tipSetKey: [{}],
                )).thenAnswer((_) async => const Left(
              {
                "message": "another error",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result =
            await _mockChainGetMessagesInTipsetAbst.getChainGetMessagesInTipset(
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

        final verifyVariable = await _chainGetMessagesInTipsetController
            .getChainGetMessagesInTipset(
          tipSetKey: [{}],
        );

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(
            () => _mockChainGetMessagesInTipsetAbst.getChainGetMessagesInTipset(
                  tipSetKey: [{}],
                )).called(2);
        verifyNoMoreInteractions(_mockChainGetMessagesInTipsetAbst);
      },
    );
  });
}
