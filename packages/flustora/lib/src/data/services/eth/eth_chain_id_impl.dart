/// Project :  Flustora 's Package
/// Description : This file contains The method would returns the currently configured chain ID, a value used in replay-protected transaction signing as introduced by EIP-155."
/// Author : James Brel
/// onCreated : 02/03/2023
/// onUpadted : #
/// Upadted by : #
import 'dart:convert';
import 'dart:io';

import 'package:crossplat_objectid/crossplat_objectid.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/eth/eth_chain_id_abst.dart';
import '../../../utils/constants/string_const.dart';
import '../../../utils/enums/errors_enum/eth_errors_enum.dart';
import '../../../utils/errors/failure_error.dart';

class EthChainIdImpl implements EthChainIdAbst {
  late http.Response _response;
  late Either<Map<String, dynamic>, Map<String, dynamic>> _data;

  @override
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getEthChainId() async {
    try {
      _response = await http.post(
        Uri.parse(endpointFvm),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode({
          "id": ObjectId().machineId,
          "jsonrpc": "2.0",
          "method": "eth_chainId",
          "params": <dynamic>[],
        }),
      );

      if (_response.statusCode == 200) {
        _data = Right(jsonDecode(_response.body) as Map<String, dynamic>);
      } else {
        _data = Left(jsonDecode(_response.body) as Map<String, dynamic>);
      }
    } on SocketException {
      _data = Left(Failures.ethMessageError(
        EthErrors.noConnection,
      ));
    }
    return _data;
  }
}
