import 'package:flustora/flustora.dart';
import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/chain/chain_get_message_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late ChainGetMessageController _chainGetMessageController;

  setUp(() {
    _chainGetMessageController = insert.sl<ChainGetMessageController>();
  });

  group('ChainGetMessageRoute =>', () {
    // write tests

    test(
      'the getChainGetMessage function should return good response or Error ("message:"you are offline) which is a Map<String,dynamic> Type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _chainGetMessageController
            .getChainGetMessage(cid: {
          "/": "bafy2bzaced2gmisnql2xiv3lxdkvbxie3mlllvb7q5uae6gnlw2y5kl3u2mt4"
        });

        //Act - Call the function that is to be tested

        final verifyValue = await Chain.getChainGetMessage(cid: {
          "/": "bafy2bzaced2gmisnql2xiv3lxdkvbxie3mlllvb7q5uae6gnlw2y5kl3u2mt4"
        });

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );

    test(
      'the getChainGetMessage function should return another Error which is a Map<String,dynamic> Type ("message:"another error)',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue =
            await _chainGetMessageController.getChainGetMessage(cid: {});

        //Act - Call the function that is to be tested

        final verifyValue = await Chain.getChainGetMessage(cid: {});

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );
  });
}
