import 'package:dartz/dartz.dart';

abstract class ChainGetMessagesInTipsetAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getChainGetMessagesInTipset({
    required List<Map<String, String>> tipSetKey,
  });
}
