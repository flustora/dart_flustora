import 'package:flustora/flustora.dart';
import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/chain/chain_get_block_message_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late ChainGetBlockMessageController _chainGetBlockMessageController;

  setUp(() {
    _chainGetBlockMessageController =
        insert.sl<ChainGetBlockMessageController>();
  });

  group('ChainGetBlockMessageRoute =>', () {
    // write tests

    test(
      'the getChainGetBlockMessage function should return good response or Error ("message:"you are offline) which is a Map<String,dynamic> Type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _chainGetBlockMessageController
            .getChainGetBlockMessage(cid: {
          "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
        });

        //Act - Call the function that is to be tested

        final verifyValue = await Chain.getChainGetBlockMessage(cid: {
          "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
        });

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );

    test(
      'the getChainGetBlockMessage function should return another Error which is a Map<String,dynamic> Type ("message:"another error)',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _chainGetBlockMessageController
            .getChainGetBlockMessage(cid: {});

        //Act - Call the function that is to be tested

        final verifyValue = await Chain.getChainGetBlockMessage(cid: {});

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );
  });
}
