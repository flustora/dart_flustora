import 'package:dartz/dartz.dart';

abstract class ChainGetTipSetAfterHeightAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getChainGetTipSetAfterHeight({
    required List<Map<String, String>> cid,
    required int height,
  });
}
