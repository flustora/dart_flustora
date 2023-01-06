import 'package:dartz/dartz.dart';

abstract class ChainGetParentMessagesAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getChainGetParentMessages({
    required Map<String, String> cid,
  });
}
