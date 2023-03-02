import 'package:dartz/dartz.dart';

abstract class EthGetBalanceAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> getEthGetBalance({
    required String accountAddress,
  });
}
