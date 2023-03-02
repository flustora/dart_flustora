import 'dart:convert';
import 'dart:io';

import 'package:crossplat_objectid/crossplat_objectid.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

/// Project :  Flustora 's Package
/// Description : This file contains the function named getChainGetGenesis whose "ChainGetTipSet returns the tipset specified by the given TipSetKey.."
/// Author : James Brel
/// onCreated : 03/01/2023
/// onUpadted : #
/// Upadted by : #
import '../../../abstract/chain/chain_get_tip_set_abst.dart';
import '../../../utils/constants/string_const.dart';
import '../../../utils/enums/errors_enum/chain_errors_enum.dart';
import '../../../utils/errors/failure_error.dart';

class ChainGetTipSetImpl implements ChainGetTipSetAbst {
  late http.Response _response;
  late Either<Map<String, dynamic>, Map<String, dynamic>> _data;

  @override
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> getChainGetTipSet({
    required List<Map<String, String>> tipSetKey,
  }) async {
    try {
      _response = await http.post(
        Uri.parse(endPoint),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode(
          {
            "id": ObjectId().machineId,
            "jsonrpc": "2.0",
            "method": "Filecoin.ChainGetTipSet",
            "params": [
              tipSetKey,
            ]
          },
        ),
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
