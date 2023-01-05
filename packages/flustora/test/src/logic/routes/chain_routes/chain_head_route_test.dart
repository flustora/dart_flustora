import 'package:flustora/flustora.dart';
import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/chain/chain_head_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late ChainHeadController _chainHeadController;

  setUp(() {
    _chainHeadController = insert.sl<ChainHeadController>();
  });

  group('ChainHeadRoute =>', () {
    // write tests

    test(
        'the getChainHead function should return good response or Error which is a Map<String,dynamic> Type',
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      final testValue = await _chainHeadController.getChainHead();

      //Act - Call the function that is to be tested

      final verifyValue = await Chain.getChainHead();

      //Assert - Compare the actual result and expected result
      expect(testValue, verifyValue);
    });
  });
}
