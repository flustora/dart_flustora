import 'package:dartz/dartz.dart';

import '../../../abstract/wallet/wallet_verify_abst.dart';

class WalletVerifyController {
  final WalletVerifyAbst walletVerifyAbst;

  WalletVerifyController({
    required this.walletVerifyAbst,
  });

  Future<Map<String, dynamic>> getWalletVerify({
    required String walletAddress,
    required String signature,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await walletVerifyAbst.getWalletVerify(
      walletAddress: walletAddress,
      signature: signature,
    );
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );
    return res;
  }
}
