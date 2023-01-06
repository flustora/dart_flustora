import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_get_messages_in_tipset_abst.dart';

class ChainGetMessagesInTipsetController {
  final ChainGetMessagesInTipsetAbst chainGetMessagesInTipsetAbst;

  ChainGetMessagesInTipsetController({
    required this.chainGetMessagesInTipsetAbst,
  });

  Future<Map<String, dynamic>> getChainGetMessagesInTipset({
    required List<Map<String, String>> tipSetKey,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await chainGetMessagesInTipsetAbst.getChainGetMessagesInTipset(
      tipSetKey: tipSetKey,
    );
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );

    return res;
  }
}
