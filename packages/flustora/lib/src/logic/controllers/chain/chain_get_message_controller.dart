import 'package:dartz/dartz.dart';

import '../../../abstract/chain/chain_get_message_abst.dart';

class ChainGetMessageController {
  final ChainGetMessageAbst chainGetMessageAbst;

  ChainGetMessageController({
    required this.chainGetMessageAbst,
  });

  Future<Map<String, dynamic>> getChainGetMessage({
    required Map<String, String> cid,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await chainGetMessageAbst.getChainGetMessage(cid: cid);
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );

    return res;
  }
}
