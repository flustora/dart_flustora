import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_tip_set_abst.dart';

class ChainGetTipSetController {
  final ChainGetTipSetAbst chainGetTipSetAbst;

  ChainGetTipSetController({
    required this.chainGetTipSetAbst,
  });

  Future<Map<String, dynamic>> getChainGetTipSet({
    required List<Map<String, String>> tipSetKey,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await chainGetTipSetAbst.getChainGetTipSet(
      tipSetKey: tipSetKey,
    );
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );

    return res;
  }
}
