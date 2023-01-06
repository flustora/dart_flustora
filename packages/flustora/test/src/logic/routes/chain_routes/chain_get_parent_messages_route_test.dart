import 'package:flustora/flustora.dart';
import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/chain/chain_get_parent_messages_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late ChainGetParentMessagesController _chainGetParentMessagesController;

  setUp(() {
    _chainGetParentMessagesController =
        insert.sl<ChainGetParentMessagesController>();
  });

  group('ChainGetParentMessagesRoute =>', () {
    // write tests

    test(
      'the getChainGetParentMessages function should return good response or Error ("message:"you are offline) which is a Map<String,dynamic> Type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _chainGetParentMessagesController
            .getChainGetParentMessages(cid: {
          "/": "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
        });

        //Act - Call the function that is to be tested

        final verifyValue = await Chain.getChainGetParentMessages(cid: {
          "/": "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
        });

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );

    test(
      'the getChainGetParentMessages function should return another Error which is a Map<String,dynamic> Type ("message:"another error)',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _chainGetParentMessagesController
            .getChainGetParentMessages(cid: {});

        //Act - Call the function that is to be tested

        final verifyValue = await Chain.getChainGetParentMessages(cid: {});

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );
  });
}
