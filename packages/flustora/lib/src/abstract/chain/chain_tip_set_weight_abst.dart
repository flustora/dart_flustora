import 'package:dartz/dartz.dart';

abstract class ChainTipSetWeightAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getChainTipSetWeight({
    required List<Map<String, String>> tipSetKey,
  });
}
