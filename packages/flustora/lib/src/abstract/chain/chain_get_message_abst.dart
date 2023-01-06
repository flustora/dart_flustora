import 'package:dartz/dartz.dart';

abstract class ChainGetMessageAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getChainGetMessage({
    required Map<String, String> cid,
  });
}
