import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_genesis_abst.dart';

class ChainGetGenesisController {
  final ChainGetGenesisAbst chainGetGenesisAbst;

  ChainGetGenesisController({
    required this.chainGetGenesisAbst,
  });

  Future<Map<String, dynamic>> getChainGetGenesis() async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await chainGetGenesisAbst.getChainGetGenesis();
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );

    return res;
  }
}
