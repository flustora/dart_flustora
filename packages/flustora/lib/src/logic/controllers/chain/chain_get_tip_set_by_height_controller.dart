import 'package:dartz/dartz.dart';

import '../../../abstract/chain/chain_get_tip_set_by_height_abst.dart';

class ChainGetTipSetByHeightController {
  final ChainGetTipSetByHeightAbst chainGetTipSetByHeightAbst;

  ChainGetTipSetByHeightController({
    required this.chainGetTipSetByHeightAbst,
  });

  Future<Map<String, dynamic>> getChainGetTipSetByHeight({
    required int height,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await chainGetTipSetByHeightAbst.getChainGetTipSetByHeight(
      height: height,
    );
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );

    return res;
  }
}
