import 'package:dartz/dartz.dart';

import '../../../abstract/eth/eth_get_block_by_hash_abst.dart';

class EthGetBlockByHashController {
  final EthGetBlockByHashAbst ethGetBlockByHashAbst;

  EthGetBlockByHashController({
    required this.ethGetBlockByHashAbst,
  });

  Future<Map<String, dynamic>> getEthGetBlockByHash({
    required String tipsetBlock,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await ethGetBlockByHashAbst.getEthGetBlockByHash(
      tipsetBlock: tipsetBlock,
    );
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );
    return res;
  }
}
