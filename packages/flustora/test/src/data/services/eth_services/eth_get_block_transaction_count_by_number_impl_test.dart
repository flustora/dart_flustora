import 'dart:convert';
import 'dart:io';

import 'package:crossplat_objectid/crossplat_objectid.dart';
import 'package:flustora/src/data/services/eth/eth_get_block_transaction_count_by_number_impl.dart';
import 'package:flustora/src/utils/constants/string_const.dart';
import 'package:flustora/src/utils/enums/errors_enum/eth_errors_enum.dart';
import 'package:flustora/src/utils/errors/failure_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  late EthGetBlockTransactionCountByNumberImpl
      _ethGetBlockTransactionCountByNumberImpl;
  setUp(() {
    _ethGetBlockTransactionCountByNumberImpl =
        EthGetBlockTransactionCountByNumberImpl();
  });

  group('EthGetBlockTransactionCountByNumberImpl => ', () {
    // write tests

    test(
      'the getEthGetBlockTransactionCountByNumber function of EthGetBlockTransactionCountByNumberImpl should return an Map<String, dynamic> response which be a ("message":"good response") or ("message":"error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        late http.Response _response;
        late Map<String, dynamic> _testValue;

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
              "method": "eth_getBlockTransactionCountByNumber",
              "params": ["0x51"],
            }),
          );

          if (_response.statusCode == 200) {
            _testValue = jsonDecode(_response.body) as Map<String, dynamic>;
          } else {
            _testValue = jsonDecode(_response.body) as Map<String, dynamic>;
          }
        } on SocketException {
          _testValue = Failures.ethMessageError(
            EthErrors.noConnection,
          );
        }

        //Act - Call the function that is to be tested
        final _verifyValue = await _ethGetBlockTransactionCountByNumberImpl
            .getEthGetBlockTransactionCountByNumber(numberBlock: "0x51");

        //Assert - Compare the actual result and expected result
        _verifyValue.fold(
          (fail) => expect(_testValue, fail),
          (succes) => expect(_testValue, succes),
        );
      },
    );
    test(
      'the getEthGetBlockTransactionCountByNumber function of EthGetBlockTransactionCountByNumberImpl should return an Map<String, dynamic> response which be a ("message":"error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        late http.Response _response;
        late Map<String, dynamic> _testValue;

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
              "method": "eth_getBlockTransactionCountByNumber",
              "params": [" "],
            }),
          );

          if (_response.statusCode == 200) {
            _testValue = jsonDecode(_response.body) as Map<String, dynamic>;
          } else {
            _testValue = jsonDecode(_response.body) as Map<String, dynamic>;
          }
        } on SocketException {
          _testValue = Failures.ethMessageError(
            EthErrors.noConnection,
          );
        }

        //Act - Call the function that is to be tested
        final _verifyValue = await _ethGetBlockTransactionCountByNumberImpl
            .getEthGetBlockTransactionCountByNumber(
          numberBlock: " ",
        );

        //Assert - Compare the actual result and expected result
        _verifyValue.fold(
          (fail) => expect(_testValue, fail),
          (succes) => expect(_testValue, succes),
        );
      },
    );
  });
}
