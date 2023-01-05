import 'package:dartz/dartz.dart';

abstract class ChainGetTipSetAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> getChainGetTipSet({
    required List<Map<String, String>> tipSetKey,
  });
}
