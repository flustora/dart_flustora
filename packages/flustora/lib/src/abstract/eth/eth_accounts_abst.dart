import 'package:dartz/dartz.dart';

abstract class EthAccountsAbst {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> getEthAccounts();
}
