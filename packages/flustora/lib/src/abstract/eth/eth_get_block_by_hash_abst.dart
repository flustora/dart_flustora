import 'package:dartz/dartz.dart';

abstract class EthGetBlockByHashAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getEthGetBlockByHash({
    required String tipsetBlock,
  });
}
