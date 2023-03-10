import 'package:dartz/dartz.dart';

abstract class EthGetBlockTransactionCountByNumberAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getEthGetBlockTransactionCountByNumber({
    required String numberBlock,
  });
}
