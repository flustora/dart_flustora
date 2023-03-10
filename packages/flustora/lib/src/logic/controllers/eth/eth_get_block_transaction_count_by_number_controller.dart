import 'package:dartz/dartz.dart';

import '../../../abstract/eth/eth_get_block_transaction_count_by_number_abst.dart';

class EthGetBlockTransactionCountByNumberController {
  final EthGetBlockTransactionCountByNumberAbst
      ethGetBlockTransactionCountByNumberAbst;

  EthGetBlockTransactionCountByNumberController({
    required this.ethGetBlockTransactionCountByNumberAbst,
  });

  Future<Map<String, dynamic>> getEthGetBlockTransactionCountByNumber({
    required String numberBlock,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await ethGetBlockTransactionCountByNumberAbst
        .getEthGetBlockTransactionCountByNumber(
      numberBlock: numberBlock,
    );
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );
    return res;
  }
}
