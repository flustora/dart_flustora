import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_tip_set_after_height_abst.dart';

class ChainGetTipSetAfterHeightController {
  final ChainGetTipSetAfterHeightAbst chainGetTipSetAfterHeightAbst;

  ChainGetTipSetAfterHeightController({
    required this.chainGetTipSetAfterHeightAbst,
  });

  Future<Map<String, dynamic>> getChainGetTipSetAfterHeight({
    required List<Map<String, String>> cid,
    required int height,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await chainGetTipSetAfterHeightAbst.getChainGetTipSetAfterHeight(
      cid: cid,
      height: height,
    );
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );

    return res;
  }
}
