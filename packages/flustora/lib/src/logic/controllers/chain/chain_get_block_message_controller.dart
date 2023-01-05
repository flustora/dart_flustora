import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_block_message_abst.dart';

class ChainGetBlockMessageController {
  final ChainGetBlockMessageAbst chainGetBlockMessageAbst;

  ChainGetBlockMessageController({
    required this.chainGetBlockMessageAbst,
  });

  Future<Map<String, dynamic>> getChainGetBlockMessage({
    required Map<String, String> cid,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await chainGetBlockMessageAbst.getChainGetBlockMessage(cid: cid);
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );

    return res;
  }
}
