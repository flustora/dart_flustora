import 'package:dartz/dartz.dart';

import '../../../abstract/eth/eth_get_block_transaction_count_by_hash_abst.dart';

class EthGetBlockTransactionCountByHashController {
  final EthGetBlockTransactionCountByHashAbst
      ethGetBlockTransactionCountByHashAbst;

  EthGetBlockTransactionCountByHashController({
    required this.ethGetBlockTransactionCountByHashAbst,
  });

  Future<Map<String, dynamic>> getEthGetBlockTransactionCountByHash({
    required String hashBlock,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await ethGetBlockTransactionCountByHashAbst
        .getEthGetBlockTransactionCountByHash(
      hashBlock: hashBlock,
    );
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );
    return res;
  }
}
