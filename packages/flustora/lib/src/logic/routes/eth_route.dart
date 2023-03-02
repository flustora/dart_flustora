import '../../injection.dart';
import '../controllers/eth/eth_accounts_controller.dart';
import '../controllers/eth/eth_block_number_controller.dart';
import '../controllers/eth/eth_chain_id_controller.dart';
import '../controllers/eth/eth_gas_price_controller.dart';
import '../controllers/eth/eth_get_balance_controller.dart';
import '../controllers/eth/eth_get_block_by_hash_controller.dart';
import '../controllers/eth/eth_get_block_by_number_controller.dart';
import '../controllers/eth/eth_get_block_transaction_count_by_hash_controller.dart';

class Eth {
  static Future<Map<String, dynamic>> getEthAccounts() async =>
      await sl<EthAccountsController>().getEthAccounts();

  static Future<Map<String, dynamic>> getEthBlockNumber() async =>
      await sl<EthBlockNumberController>().getEthBlockNumber();

  static Future<Map<String, dynamic>> getEthChainId() async =>
      await sl<EthChainIdController>().getEthChainId();

  static Future<Map<String, dynamic>> getEthGasPrice() async =>
      await sl<EthGasPriceController>().getEthGasPrice();

  static Future<Map<String, dynamic>> getEthGetBalance({
    required String accountAddress,
  }) async =>
      await sl<EthGetBalanceController>().getEthGetBalance(
        accountAddress: accountAddress,
      );

  static Future<Map<String, dynamic>> getEthGetBlockByHash({
    required String tipsetBlock,
  }) async =>
      await sl<EthGetBlockByHashController>().getEthGetBlockByHash(
        tipsetBlock: tipsetBlock,
      );

  static Future<Map<String, dynamic>> getEthGetBlockByNumber({
    required String numberBlock,
  }) async =>
      await sl<EthGetBlockByNumberController>().getEthGetBlockByNumber(
        numberBlock: numberBlock,
      );

  static Future<Map<String, dynamic>> getEthGetBlockTransactionCountByHash({
    required String hashBlock,
  }) async =>
      await sl<EthGetBlockTransactionCountByHashController>()
          .getEthGetBlockTransactionCountByHash(
        hashBlock: hashBlock,
      );
}
