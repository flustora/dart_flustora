import 'package:dartz/dartz.dart';

abstract class ChainGetParentReceiptsAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getChainGetParentReceipts({
    required Map<String, String> cid,
  });
}
