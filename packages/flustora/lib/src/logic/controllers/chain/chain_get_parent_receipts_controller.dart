import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_parent_receipts_abst.dart';

class ChainGetParentReceiptsController {
  final ChainGetParentReceiptsAbst chainGetParentReceiptsAbst;

  ChainGetParentReceiptsController({
    required this.chainGetParentReceiptsAbst,
  });

  Future<Map<String, dynamic>> getChainGetParentReceipts({
    required Map<String, String> cid,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result =
        await chainGetParentReceiptsAbst.getChainGetParentReceipts(cid: cid);
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );

    return res;
  }
}
