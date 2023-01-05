/// Project :  Flustora 's Package
/// Description : This file contains the function named ChainHasObj whose "ChainHasObj checks if a given CID exists in the chain blockstore."
/// Author : James Brel
/// onCreated : 04/01/2023
/// onUpadted : #
/// Upadted by : #
import 'dart:convert';
import 'dart:io';

import 'package:crossplat_objectid/crossplat_objectid.dart';
import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_has_obj_abst.dart';
import 'package:flustora/src/utils/constants/string_const.dart';
import 'package:flustora/src/utils/enums/errors_enum/chain_errors_enum.dart';
import 'package:flustora/src/utils/errors/failure_error.dart';
import 'package:http/http.dart' as http;

class ChainHasObjImpl implements ChainHasObjAbst {
  late http.Response _response;
  late Either<Map<String, dynamic>, Map<String, dynamic>> _data;

  @override
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> getChainHasObj({
    required Map<String, String> cid,
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
            "method": "Filecoin.ChainHasObj",
            "params": [
              cid,
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
