import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_tip_set_weight_abst.dart';

class ChainTipSetWeightController {
  final ChainTipSetWeightAbst chainTipSetWeightAbst;

  ChainTipSetWeightController({
    required this.chainTipSetWeightAbst,
  });

  Future<Map<String, dynamic>> getChainTipSetWeight({
    required List<Map<String, String>> tipSetKey,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await chainTipSetWeightAbst.getChainTipSetWeight(
      tipSetKey: tipSetKey,
    );
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );

    return res;
  }
}
