import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_message_abst.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_message_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChainGetMessageAbst extends Mock implements ChainGetMessageAbst {}

void main() async {
  late MockChainGetMessageAbst _mockChainGetMessageAbst;
  late ChainGetMessageController _chainGetMessageController;

  setUp(() {
    _mockChainGetMessageAbst = MockChainGetMessageAbst();
    _chainGetMessageController = ChainGetMessageController(
      chainGetMessageAbst: _mockChainGetMessageAbst,
    );
  });

  group('ChainGetMessageController => ', () {
    // write tests

    test(
      'getChainGetMessage of ChainGetMessageController should return an Map<String, dynamic> response which be a ("message":"good response")  ',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () => _mockChainGetMessageAbst.getChainGetMessage(cid: {
                  "/":
                      "bafy2bzaced2gmisnql2xiv3lxdkvbxie3mlllvb7q5uae6gnlw2y5kl3u2mt4"
                })).thenAnswer((_) async => const Right(
              {
                "message": "good response",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetMessageAbst.getChainGetMessage(cid: {
          "/": "bafy2bzaced2gmisnql2xiv3lxdkvbxie3mlllvb7q5uae6gnlw2y5kl3u2mt4"
        });
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _chainGetMessageController
            .getChainGetMessage(cid: {
          "/": "bafy2bzaced2gmisnql2xiv3lxdkvbxie3mlllvb7q5uae6gnlw2y5kl3u2mt4"
        });

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetMessageAbst.getChainGetMessage(cid: {
              "/":
                  "bafy2bzaced2gmisnql2xiv3lxdkvbxie3mlllvb7q5uae6gnlw2y5kl3u2mt4"
            })).called(2);
        verifyNoMoreInteractions(_mockChainGetMessageAbst);
      },
    );

    test(
      'getChainGetMessage of ChainGetMessageController should return an Map<String, dynamic> response which be a bad response ("message": "You are offline")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(
            () => _mockChainGetMessageAbst.getChainGetMessage(cid: {
                  "/":
                      "bafy2bzaced2gmisnql2xiv3lxdkvbxie3mlllvb7q5uae6gnlw2y5kl3u2mt4"
                })).thenAnswer((_) async => const Left(
              {
                "message": "You are offline",
              },
            ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetMessageAbst.getChainGetMessage(cid: {
          "/": "bafy2bzaced2gmisnql2xiv3lxdkvbxie3mlllvb7q5uae6gnlw2y5kl3u2mt4"
        });
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable = await _chainGetMessageController
            .getChainGetMessage(cid: {
          "/": "bafy2bzaced2gmisnql2xiv3lxdkvbxie3mlllvb7q5uae6gnlw2y5kl3u2mt4"
        });

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetMessageAbst.getChainGetMessage(cid: {
              "/":
                  "bafy2bzaced2gmisnql2xiv3lxdkvbxie3mlllvb7q5uae6gnlw2y5kl3u2mt4"
            })).called(2);
        verifyNoMoreInteractions(_mockChainGetMessageAbst);
      },
    );

    test(
      'getChainGetMessage of ChainGetMessageController should return an Map<String, dynamic> response which be a bad response ("message": "another error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => _mockChainGetMessageAbst.getChainGetMessage(cid: {}))
            .thenAnswer((_) async => const Left(
                  {
                    "message": "another error",
                  },
                ));
        late Map<String, dynamic> res;
        late Either<Map<String, dynamic>, Map<String, dynamic>> result;
        result = await _mockChainGetMessageAbst.getChainGetMessage(cid: {});
        result.fold(
          (fail) {
            res = fail;
          },
          (success) {
            res = success;
          },
        );

        final verifyVariable =
            await _chainGetMessageController.getChainGetMessage(cid: {});

        //Assert - Compare the actual result and expected result
        expect(verifyVariable, res);
        verify(() => _mockChainGetMessageAbst.getChainGetMessage(cid: {}))
            .called(2);
        verifyNoMoreInteractions(_mockChainGetMessageAbst);
      },
    );
  });
}
