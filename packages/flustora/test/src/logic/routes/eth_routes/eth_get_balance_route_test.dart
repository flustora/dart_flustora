import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/eth/eth_get_balance_controller.dart';
import 'package:flustora/src/logic/routes/eth_route.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late EthGetBalanceController _ethGetBalanceController;

  setUp(() {
    _ethGetBalanceController = insert.sl<EthGetBalanceController>();
  });

  group('EthGetBalanceRoute => ', () {
    // write tests
    test(
        "the getEthGetBalance function's route should return good response if all the logic is good or Error if the the package's user is not connected and the response will be a Map<String,dynamic> Type",
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      final testValue = await _ethGetBalanceController.getEthGetBalance(
          accountAddress: '0x3e1F70090cf4476d788C5259F50F89E9fB88bF1a');

      //Act - Call the function that is to be tested

      final verifyValue = await Eth.getEthGasPrice();

      //Assert - Compare the actual result and expected result
      expect(testValue, verifyValue);
    });

    test(
        "the getEthGetBalance function's route should return Error which is a Map<String,dynamic> Type if the Accoutaddres is empty",
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      final testValue =
          await _ethGetBalanceController.getEthGetBalance(accountAddress: '');

      //Act - Call the function that is to be tested

      final verifyValue = await Eth.getEthGasPrice();

      //Assert - Compare the actual result and expected result
      expect(testValue, verifyValue);
    });
  });
}
