import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/eth/eth_get_block_transaction_count_by_hash_controller.dart';
import 'package:flustora/src/logic/routes/eth_route.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late EthGetBlockTransactionCountByHashController
      _ethGetBlockTransactionCountByHashController;

  setUp(() {
    _ethGetBlockTransactionCountByHashController =
        insert.sl<EthGetBlockTransactionCountByHashController>();
  });

  group('EthGetBlockTransactionCountByHashRoute => ', () {
    // write tests
    test(
        "the getEthGetBlockTransactionCountByHash function's route should return good response if all the logic is good or Error if the the package's user is not connected and the response will be a Map<String,dynamic> Type",
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      final testValue = await _ethGetBlockTransactionCountByHashController
          .getEthGetBlockTransactionCountByHash(
              hashBlock:
                  '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64');

      //Act - Call the function that is to be tested

      final verifyValue = await Eth.getEthGetBlockTransactionCountByHash(
          hashBlock:
              '0x51c95ee9dc9ec19c46d56a89ad87d6a9f554357b40db52c69240d4d09c5b7c64');

      //Assert - Compare the actual result and expected result
      expect(testValue, verifyValue);
    });

    test(
        "the getEthGetBlockTransactionCountByHash function's route should return Error which is a Map<String,dynamic> Type if the Accoutaddres is empty",
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      final testValue = await _ethGetBlockTransactionCountByHashController
          .getEthGetBlockTransactionCountByHash(hashBlock: '');

      //Act - Call the function that is to be tested

      final verifyValue =
          await Eth.getEthGetBlockTransactionCountByHash(hashBlock: '');

      //Assert - Compare the actual result and expected result
      expect(testValue, verifyValue);
    });
  });
}
