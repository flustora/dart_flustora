import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_parent_messages_abst.dart';

class ChainGetParentMessagesController {
  final ChainGetParentMessagesAbst chainGetParentMessagesAbst;

  ChainGetParentMessagesController({
    required this.chainGetParentMessagesAbst,
  });

  Future<Map<String, dynamic>> getChainGetParentMessages({
    required Map<String, String> cid,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result =
        await chainGetParentMessagesAbst.getChainGetParentMessages(cid: cid);
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );

    return res;
  }
}
