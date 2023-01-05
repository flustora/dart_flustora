import 'package:flustora/flustora.dart';
import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/chain/chain_has_obj_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late ChainHasObjController _chainHasObjController;

  setUp(() {
    _chainHasObjController = insert.sl<ChainHasObjController>();
  });

  group('ChainHasObjRoute =>', () {
    // write tests

    test(
      'the getChainHasObj function should return good response or Error which is a Map<String,dynamic> Type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _chainHasObjController.getChainHasObj(cid: {
          "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
        });

        //Act - Call the function that is to be tested

        final verifyValue = await Chain.getChainHasObj(cid: {
          "/": "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
        });

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );

    test(
      'the getChainHasObj function should return another Error which is a Map<String,dynamic> Type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _chainHasObjController.getChainHasObj(cid: {});

        //Act - Call the function that is to be tested

        final verifyValue = await Chain.getChainHasObj(cid: {});

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );
  });
}
