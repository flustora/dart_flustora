import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/wallet/wallet_validate_address_abst.dart';

class WalletValidateAddressController {
  final WalletValidateAddressAbst walletValidateAddressAbst;

  WalletValidateAddressController({
    required this.walletValidateAddressAbst,
  });

  Future<Map<String, dynamic>> getWalletValidateAddress({
    required String walletAddress,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await walletValidateAddressAbst.getWalletValidateAddress(
      walletAddress: walletAddress,
    );
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );
    return res;
  }
}
