import 'package:dartz/dartz.dart';

abstract class EthBlockNumberAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getEthBlockNumber();
}
