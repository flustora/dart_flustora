import 'package:dartz/dartz.dart';

abstract class EthChainIdAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> getEthChainId();
}
