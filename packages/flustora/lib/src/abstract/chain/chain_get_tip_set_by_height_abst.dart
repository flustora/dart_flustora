import 'package:dartz/dartz.dart';

abstract class ChainGetTipSetByHeightAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getChainGetTipSetByHeight({
    required int height,
  });
}
