import 'package:dartz/dartz.dart';

abstract class EthGasPriceAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> getEthGasPrice();
}
