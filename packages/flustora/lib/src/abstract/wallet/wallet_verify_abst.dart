import 'package:dartz/dartz.dart';

abstract class WalletVerifyAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> getWalletVerify({
    required String walletAddress,
    required String signature,
  });
}
