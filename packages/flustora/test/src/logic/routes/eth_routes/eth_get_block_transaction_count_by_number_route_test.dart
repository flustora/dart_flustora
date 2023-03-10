import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/eth/eth_get_block_transaction_count_by_number_controller.dart';
import 'package:flustora/src/logic/routes/eth_route.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late EthGetBlockTransactionCountByNumberController
      _ethGetBlockTransactionCountByNumberController;

  setUp(() {
    _ethGetBlockTransactionCountByNumberController =
        insert.sl<EthGetBlockTransactionCountByNumberController>();
  });

  group('EthGetBlockTransactionCountByNumberRoute => ', () {
    // write tests
    test(
        "the getEthGetBlockTransactionCountByNumber function's route should return good response if all the logic is good or Error if the the package's user is not connected and the response will be a Map<String,dynamic> Type",
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      final testValue = await _ethGetBlockTransactionCountByNumberController
          .getEthGetBlockTransactionCountByNumber(numberBlock: '0x51');

      //Act - Call the function that is to be tested

      final verifyValue =
          await Eth.getEthGetBlockTransactionCountByNumber(numberBlock: '0x51');

      //Assert - Compare the actual result and expected result
      expect(testValue, verifyValue);
    });

    test(
        "the getEthGetBlockTransactionCountByNumber function's route should return Error which is a Map<String,dynamic> Type if the Accoutaddres is empty",
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      final testValue = await _ethGetBlockTransactionCountByNumberController
          .getEthGetBlockTransactionCountByNumber(numberBlock: '');

      //Act - Call the function that is to be tested

      final verifyValue =
          await Eth.getEthGetBlockTransactionCountByNumber(numberBlock: '');

      //Assert - Compare the actual result and expected result
      expect(testValue, verifyValue);
    });
  });
}
