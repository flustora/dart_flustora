import 'package:dartz/dartz.dart';

abstract class ChainGetGenesisAbst {
  @override
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getChainGetGenesis();
}
