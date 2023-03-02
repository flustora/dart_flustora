/// Project :  Flustora 's Package
/// Description : This file contains the function named getChainTipSetWeight whose "ChainTipSetWeight computes weight for the specified tipset."
/// Author : James Brel
/// onCreated : 06/01/2023
/// onUpadted : #
/// Upadted by : #
import 'dart:convert';
import 'dart:io';

import 'package:crossplat_objectid/crossplat_objectid.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/chain/chain_tip_set_weight_abst.dart';
import '../../../utils/constants/string_const.dart';
import '../../../utils/enums/errors_enum/chain_errors_enum.dart';
import '../../../utils/errors/failure_error.dart';

class ChainTipSetWeightImpl implements ChainTipSetWeightAbst {
  late http.Response _response;
  late Either<Map<String, dynamic>, Map<String, dynamic>> _data;

  @override
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getChainTipSetWeight({
    required List<Map<String, String>> tipSetKey,
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
          "method": "Filecoin.ChainTipSetWeight",
          "params": [
            tipSetKey,
          ]
        }),
      );

      if (_response.statusCode == 200) {
        _data = Right(jsonDecode(_response.body) as Map<String, dynamic>);
      } else {
        _data = Left(jsonDecode(_response.body) as Map<String, dynamic>);
      }
    } on SocketException {
      _data = Left(Failures.chainMessageError(
        ChainErrors.noConnection,
      ));
    }
    return _data;
  }
}
