import 'package:dartz/dartz.dart';

abstract class WalletBalanceAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> getWalletBalance({
    required String walletAddress,
  });
}
