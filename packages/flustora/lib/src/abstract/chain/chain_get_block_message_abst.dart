import 'package:dartz/dartz.dart';

abstract class ChainGetBlockMessageAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getChainGetBlockMessage({
    required Map<String, String> cid,
  });
}
