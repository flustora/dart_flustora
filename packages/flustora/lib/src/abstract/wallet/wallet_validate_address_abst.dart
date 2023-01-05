import 'package:dartz/dartz.dart';

abstract class WalletValidateAddressAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getWalletValidateAddress({
    required String walletAddress,
  });
}
