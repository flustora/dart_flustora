import 'package:equatable/equatable.dart';

import '../enums/errors_enum/chain_errors_enum.dart';
import '../enums/errors_enum/eth_errors_enum.dart';
import '../enums/errors_enum/wallet_errors_enum.dart';

class Failures extends Equatable {
  static Map<String, dynamic> walletMessageError(WalletErrors error) {
    switch (error) {
      case WalletErrors.noConnection:
        return {
          "message": "You are offline",
        };

      default:
        return {"message": "Unknown error"};
    }
  }

  static Map<String, dynamic> chainMessageError(ChainErrors error) {
    switch (error) {
      case ChainErrors.noConnection:
        return {
          "message": "You are offline",
        };

      default:
        return {"message": "Unknown error"};
    }
  }

  static Map<String, dynamic> ethMessageError(EthErrors error) {
    switch (error) {
      case EthErrors.noConnection:
        return {
          "message": "You are offline",
        };

      default:
        return {"message": "Unknown error"};
    }
  }

  @override
  List<Object?> get props => [];
}
