import 'package:dartz/dartz.dart';

abstract class EthGetBlockByNumberAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getEthGetBlockByNumber({
    required String numberBlock,
  });
}
