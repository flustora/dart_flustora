import 'package:dartz/dartz.dart';

abstract class ChainHasObjAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> getChainHasObj({
    required Map<String, String> cid,
  });
}
