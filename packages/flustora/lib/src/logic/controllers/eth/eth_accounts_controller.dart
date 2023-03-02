import 'package:dartz/dartz.dart';

import '../../../abstract/eth/eth_accounts_abst.dart';

class EthAccountsController {
  final EthAccountsAbst ethAccountsAbst;

  EthAccountsController({
    required this.ethAccountsAbst,
  });

  Future<Map<String, dynamic>> getEthAccounts() async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await ethAccountsAbst.getEthAccounts();
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );
    return res;
  }
}
