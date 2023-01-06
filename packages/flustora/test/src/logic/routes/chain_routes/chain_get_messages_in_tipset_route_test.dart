import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/chain/chain_get_messages_in_tipset_controller.dart';
import 'package:flustora/src/logic/routes/chain_route.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late ChainGetMessagesInTipsetController _chainGetMessagesInTipsetController;

  setUp(() {
    _chainGetMessagesInTipsetController =
        insert.sl<ChainGetMessagesInTipsetController>();
  });

  group('ChainGetMessagesInTipsetRoute =>', () {
    // write tests
    test(
      'the getChainGetMessagesInTipset function of ChainGetMessagesInTipsetRoute should return good response or Error which is a Map<String,dynamic> Type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _chainGetMessagesInTipsetController
            .getChainGetMessagesInTipset(tipSetKey: [
          {
            "/":
                "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e",
          }
        ]);

        //Act - Call the function that is to be tested

        final verifyValue = await Chain.getChainGetMessagesInTipset(tipSetKey: [
          {
            "/":
                "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e",
          }
        ]);

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );

    test(
      'the getChainGetMessagesInTipset function of ChainGetMessagesInTipsetRoute should return another Error which is a Map<String,dynamic> Type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _chainGetMessagesInTipsetController
            .getChainGetMessagesInTipset(tipSetKey: [{}]);

        //Act - Call the function that is to be tested

        final verifyValue =
            await Chain.getChainGetMessagesInTipset(tipSetKey: [{}]);

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );
  });
}
