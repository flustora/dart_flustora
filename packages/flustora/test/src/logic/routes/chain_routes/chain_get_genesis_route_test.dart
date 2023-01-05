import 'package:flustora/flustora.dart';
import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/chain/chain_get_genesis_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late ChainGetGenesisController _chainGetGenesisController;

  setUp(() {
    _chainGetGenesisController = insert.sl<ChainGetGenesisController>();
  });

  group('ChainGetGenesisRoute =>', () {
    // write tests

    test(
        'the getChainGetGenesis function should return good response or Error which is a Map<String,dynamic> Type',
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      final testValue = await _chainGetGenesisController.getChainGetGenesis();

      //Act - Call the function that is to be tested

      final verifyValue = await Chain.getChainGetGenesis();

      //Assert - Compare the actual result and expected result
      expect(testValue, verifyValue);
    });
  });
}
