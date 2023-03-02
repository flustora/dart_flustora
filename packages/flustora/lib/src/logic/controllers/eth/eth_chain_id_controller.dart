import 'package:dartz/dartz.dart';

import '../../../abstract/eth/eth_chain_id_abst.dart';

class EthChainIdController {
  final EthChainIdAbst ethChainIdAbst;

  EthChainIdController({
    required this.ethChainIdAbst,
  });
  Future<Map<String, dynamic>> getEthChainId() async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await ethChainIdAbst.getEthChainId();
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );
    return res;
  }
}
