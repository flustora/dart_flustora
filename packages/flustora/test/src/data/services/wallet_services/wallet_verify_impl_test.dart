import 'dart:convert';
import 'dart:io';

import 'package:crossplat_objectid/crossplat_objectid.dart';
import 'package:flustora/src/data/services/wallet/wallet_verify_impl.dart';
import 'package:flustora/src/utils/constants/string_const.dart';
import 'package:flustora/src/utils/enums/errors_enum/wallet_errors_enum.dart';
import 'package:flustora/src/utils/errors/failure_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  late WalletVerifyImpl _walletVerifyImpl;
  setUp(() {
    _walletVerifyImpl = WalletVerifyImpl();
  });

  group('WalletVerifyImpl => ', () {
    // write tests

    test(
      'the getWalletVerify function of WalletVerifyImpl should return a Map<String, dynamic> response which be a ("message":"good response")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        late http.Response _response;
        late Map<String, dynamic> _testValue;

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
              "method": "Filecoin.WalletVerify",
              "params": [
                "f2kmbjvz7vagl2z6pfrbjoggrkjofxspp7cqtw2zy",
                "Ynl0ZSBhcnJheD==",
                {
                  "Data": "Ynl0ZSBhcnJheD==",
                  "Type": 2,
                }
              ]
            }),
          );

          if (_response.statusCode == 200) {
            _testValue = jsonDecode(_response.body) as Map<String, dynamic>;
          } else {
            _testValue = jsonDecode(_response.body) as Map<String, dynamic>;
          }
        } on SocketException {
          _testValue = Failures.walletMessageError(
            WalletErrors.noConnection,
          );
        }

        //Act - Call the function that is to be tested
        final _verifyValue = await _walletVerifyImpl.getWalletVerify(
          walletAddress: "f2kmbjvz7vagl2z6pfrbjoggrkjofxspp7cqtw2zy",
          signature: 'Ynl0ZSBhcnJheD==',
        );

        //Assert - Compare the actual result and expected result
        _verifyValue.fold(
          (fail) => expect(_testValue, fail),
          (succes) => expect(_testValue, succes),
        );
      },
    );
    test(
      'the getWalletVerify function of WalletVerifyImpl should return a Map<String, dynamic> response which be a a ("message":"error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        late http.Response _response;
        late Map<String, dynamic> _testValue;

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
              "method": "Filecoin.WalletVerify",
              "params": [
                "",
                "Ynl0ZSBhcnJheD==",
                {
                  "Data": "Ynl0ZSBhcnJheD==",
                  "Type": 2,
                }
              ]
            }),
          );

          if (_response.statusCode == 200) {
            _testValue = jsonDecode(_response.body) as Map<String, dynamic>;
          } else {
            _testValue = jsonDecode(_response.body) as Map<String, dynamic>;
          }
        } on SocketException {
          _testValue = Failures.walletMessageError(
            WalletErrors.noConnection,
          );
        }

        //Act - Call the function that is to be tested
        final _verifyValue = await _walletVerifyImpl.getWalletVerify(
          walletAddress: "",
          signature: 'Ynl0ZSBhcnJheD==',
        );

        //Assert - Compare the actual result and expected result
        _verifyValue.fold(
          (fail) => expect(_testValue, fail),
          (succes) => expect(_testValue, succes),
        );
      },
    );

    test(
      'the getWalletVerify function of WalletVerifyImpl should return a Map<String, dynamic> response which be a a ("message":"another error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        late http.Response _response;
        late Map<String, dynamic> _testValue;

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
              "method": "Filecoin.WalletVerify",
              "params": [
                "f2kmbjvz7vagl2z6pfrbjoggrkjofxspp7cqtw2zy",
                "",
                {
                  "Data": "",
                  "Type": 2,
                }
              ]
            }),
          );

          if (_response.statusCode == 200) {
            _testValue = jsonDecode(_response.body) as Map<String, dynamic>;
          } else {
            _testValue = jsonDecode(_response.body) as Map<String, dynamic>;
          }
        } on SocketException {
          _testValue = Failures.walletMessageError(
            WalletErrors.noConnection,
          );
        }

        //Act - Call the function that is to be tested
        final _verifyValue = await _walletVerifyImpl.getWalletVerify(
          walletAddress: "f2kmbjvz7vagl2z6pfrbjoggrkjofxspp7cqtw2zy",
          signature: '',
        );

        //Assert - Compare the actual result and expected result
        _verifyValue.fold(
          (fail) => expect(_testValue, fail),
          (succes) => expect(_testValue, succes),
        );
      },
    );

    test(
      'the getWalletVerify function of WalletVerifyImpl should return a Map<String, dynamic> response which be a a ("message":"second another error")',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        late http.Response _response;
        late Map<String, dynamic> _testValue;

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
              "method": "Filecoin.WalletVerify",
              "params": [
                "",
                "",
                {
                  "Data": "",
                  "Type": 2,
                }
              ]
            }),
          );

          if (_response.statusCode == 200) {
            _testValue = jsonDecode(_response.body) as Map<String, dynamic>;
          } else {
            _testValue = jsonDecode(_response.body) as Map<String, dynamic>;
          }
        } on SocketException {
          _testValue = Failures.walletMessageError(
            WalletErrors.noConnection,
          );
        }

        //Act - Call the function that is to be tested
        final _verifyValue = await _walletVerifyImpl.getWalletVerify(
          walletAddress: "",
          signature: '',
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
