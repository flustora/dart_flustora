import 'package:dartz/dartz.dart';

abstract class ChainGetGenesisAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getChainGetGenesis();
}
