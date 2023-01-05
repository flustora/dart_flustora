import 'package:dartz/dartz.dart';

abstract class ChainHeadAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> getChainHead();
}
