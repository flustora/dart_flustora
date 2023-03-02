import 'package:dartz/dartz.dart';

import '../../../abstract/eth/eth_block_number_abst.dart';

class EthBlockNumberController {
  final EthBlockNumberAbst ethBlockNumberAbst;

  EthBlockNumberController({
    required this.ethBlockNumberAbst,
  });

  Future<Map<String, dynamic>> getEthBlockNumber() async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await ethBlockNumberAbst.getEthBlockNumber();
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );
    return res;
  }
}
