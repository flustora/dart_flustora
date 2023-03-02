import 'package:dartz/dartz.dart';

import '../../../abstract/wallet/wallet_balance_abst.dart';

class WalletBalanceController {
  final WalletBalanceAbst walletBalanceAbst;

  WalletBalanceController({
    required this.walletBalanceAbst,
  });

  Future<Map<String, dynamic>> getWalletBalance({
    required String walletAddress,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await walletBalanceAbst.getWalletBalance(
      walletAddress: walletAddress,
    );
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );

    return res;
  }
}
