import 'package:dartz/dartz.dart';

abstract class ChainReadObjAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> getChainReadObj({
    required Map<String, String> cid,
  });
}
