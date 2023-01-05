import 'package:dartz/dartz.dart';

abstract class ChainGetBlockAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> getChainGetBlock({
    required Map<String, String> cid,
  });
}
