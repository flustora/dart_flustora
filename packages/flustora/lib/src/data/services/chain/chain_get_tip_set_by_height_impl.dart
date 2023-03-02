/// Project :  Flustora 's Package
/// Description : This file contains the function named getChainGetTipSetByHeight whose "ChainGetTipSetByHeight looks back for a tipset at the specified epoch. If there are no blocks at the specified epoch, a tipset at an earlier epoch will be returned."
/// Author : James Brel
/// onCreated : 03/01/2023
/// onUpadted : #
/// Upadted by : #
import 'dart:convert';
import 'dart:io';

import 'package:crossplat_objectid/crossplat_objectid.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/chain/chain_get_tip_set_by_height_abst.dart';
import '../../../utils/constants/string_const.dart';
import '../../../utils/enums/errors_enum/chain_errors_enum.dart';
import '../../../utils/errors/failure_error.dart';

class ChainGetTipSetByHeightImpl implements ChainGetTipSetByHeightAbst {
  late http.Response _response;
  late Either<Map<String, dynamic>, Map<String, dynamic>> _data;

  @override
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>>
      getChainGetTipSetByHeight({
    required int height,
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
          "method": "Filecoin.ChainGetTipSetByHeight",
          "params": [
            height,
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
