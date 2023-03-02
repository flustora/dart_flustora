import 'package:dartz/dartz.dart';

import '../../../abstract/eth/eth_get_balance_abst.dart';

class EthGetBalanceController {
  final EthGetBalanceAbst ethGetBalanceAbst;

  EthGetBalanceController({
    required this.ethGetBalanceAbst,
  });

  Future<Map<String, dynamic>> getEthGetBalance({
    required String accountAddress,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await ethGetBalanceAbst.getEthGetBalance(
      accountAddress: accountAddress,
    );
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );
    return res;
  }
}
