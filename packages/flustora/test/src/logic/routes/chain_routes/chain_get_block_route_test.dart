import 'package:flustora/flustora.dart';
import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/chain/chain_get_block_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late ChainGetBlockController _chainGetBlockController;

  setUp(() {
    _chainGetBlockController = insert.sl<ChainGetBlockController>();
  });

  group('ChainGetBlockRoute =>', () {
    // write tests

    test(
      'the getChainGetBlock function should return good response or Error which is a Map<String,dynamic> Type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _chainGetBlockController.getChainGetBlock(cid: {
          "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
        });

        //Act - Call the function that is to be tested

        final verifyValue = await Chain.getChainGetBlock(cid: {
          "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
        });

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );

    test(
      'the getChainGetBlock function should return another Error which is a Map<String,dynamic> Type ("message:"another error',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue =
            await _chainGetBlockController.getChainGetBlock(cid: {});

        //Act - Call the function that is to be tested

        final verifyValue = await Chain.getChainGetBlock(cid: {});

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );
  });
}
