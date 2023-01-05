import 'package:flustora/flustora.dart';
import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/chain/chain_read_obj_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late ChainReadObjController _chainReadObjController;

  setUp(() {
    _chainReadObjController = insert.sl<ChainReadObjController>();
  });

  group('ChainReadObjRoute =>', () {
    // write tests

    test(
        'the getChainReadObj function should return good response or Error which is a Map<String,dynamic> Type',
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      final testValue = await _chainReadObjController.getChainReadObj(cid: {
        "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
      });

      //Act - Call the function that is to be tested

      final verifyValue = await Chain.getChainReadObj(cid: {
        "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
      });

      //Assert - Compare the actual result and expected result
      expect(testValue, verifyValue);
    });
  });
}
