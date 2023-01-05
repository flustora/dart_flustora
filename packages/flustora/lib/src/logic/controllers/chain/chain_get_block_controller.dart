import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_block_abst.dart';

class ChainGetBlockController {
  final ChainGetBlockAbst chainGetBlockAbst;

  ChainGetBlockController({
    required this.chainGetBlockAbst,
  });

  Future<Map<String, dynamic>> getChainGetBlock({
    required Map<String, String> cid,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await chainGetBlockAbst.getChainGetBlock(cid: cid);
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );

    return res;
  }
}
