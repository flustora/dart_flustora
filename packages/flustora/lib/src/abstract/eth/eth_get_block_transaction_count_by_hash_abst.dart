import 'package:dartz/dartz.dart';

abstract class EthGetBlockTransactionCountByHashAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getEthGetBlockTransactionCountByHash({
    required String hashBlock,
  });
}
