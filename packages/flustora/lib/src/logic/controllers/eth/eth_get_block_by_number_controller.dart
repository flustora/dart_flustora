import 'package:dartz/dartz.dart';

import '../../../abstract/eth/eth_get_block_by_number_abst.dart';

class EthGetBlockByNumberController {
  final EthGetBlockByNumberAbst ethGetBlockByNumberAbst;

  EthGetBlockByNumberController({
    required this.ethGetBlockByNumberAbst,
  });

  Future<Map<String, dynamic>> getEthGetBlockByNumber({
    required String numberBlock,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await ethGetBlockByNumberAbst.getEthGetBlockByNumber(
      numberBlock: numberBlock,
    );
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );
    return res;
  }
}
