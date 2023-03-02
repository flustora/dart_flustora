import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/eth/eth_chain_id_controller.dart';
import 'package:flustora/src/logic/routes/eth_route.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late EthChainIdController _ethChainIdController;

  setUp(() {
    _ethChainIdController = insert.sl<EthChainIdController>();
  });

  group('EthChainIdRoute => ', () {
    // write tests
    test(
        "the getEthChainId function's route should return good response if all the logic is good or Error if the the package's user is not connected and the response will be a Map<String,dynamic> Type",
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      final testValue = await _ethChainIdController.getEthChainId();

      //Act - Call the function that is to be tested

      final verifyValue = await Eth.getEthChainId();

      //Assert - Compare the actual result and expected result
      expect(testValue, verifyValue);
    });
  });
}
