/// Project :  Flustora 's Package
/// Description : This file contains the function named getWalletValidateAddress whose "WalletBalance returns the balance of the address given to the current head of the chain."
/// Author : James Brel
/// onCreated : 27/12/2022
/// onUpadted : 29/12/2022
/// Upadted by : #
import 'dart:convert';
import 'dart:io';

import 'package:crossplat_objectid/crossplat_objectid.dart';
import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/wallet/wallet_balance_abst.dart';
import 'package:flustora/src/utils/constants/string_const.dart';
import 'package:flustora/src/utils/enums/errors_enum/wallet_errors_enum.dart';
import 'package:flustora/src/utils/errors/failure_error.dart';
import 'package:http/http.dart' as http;

class WalletBalanceImpl implements WalletBalanceAbst {
  late http.Response _response;
  late Either<Map<String, dynamic>, Map<String, dynamic>> _data;

  @override
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> getWalletBalance({
    required String walletAddress,
  }) async {
    try {
      _response = await http.post(
        Uri.parse(endPoint),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode({
          "id": ObjectId().machineId,
          "jsonrpc": "2.0",
          "method": "Filecoin.WalletBalance",
          "params": [walletAddress],
        }),
      );

      if (_response.statusCode == 200) {
        _data = Right(jsonDecode(_response.body) as Map<String, dynamic>);
      } else {
        _data = Left(jsonDecode(_response.body) as Map<String, dynamic>);
      }
    } on SocketException {
      _data = Left(Failures.walletMessageError(
        WalletErrors.noConnection,
      ));
    }
    return _data;
  }
}
