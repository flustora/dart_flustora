import 'dart:convert';
import 'dart:io';

import 'package:crossplat_objectid/crossplat_objectid.dart';
import 'package:flustora/src/data/services/wallet/wallet_validate_address_impl.dart';
import 'package:flustora/src/utils/constants/string_const.dart';
import 'package:flustora/src/utils/enums/errors_enum/wallet_errors_enum.dart';
import 'package:flustora/src/utils/errors/failure_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  late WalletValidateAddressImpl _walletValidateAddressImpl;
  setUp(() {
    _walletValidateAddressImpl = WalletValidateAddressImpl();
  });

  group('WalletValidateAddressImpl => ', () {
    // write tests

    test(
      'the getWalletValidateAddress function of WalletValidateAddressImpl should return a Map<String, dynamic> response which be a ("message":"good response")',
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
              "method": "Filecoin.WalletValidateAddress",
              "params": ["f2kmbjvz7vagl2z6pfrbjoggrkjofxspp7cqtw2zy"],
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
        final _verifyValue =
            await _walletValidateAddressImpl.getWalletValidateAddress(
          walletAddress: "f2kmbjvz7vagl2z6pfrbjoggrkjofxspp7cqtw2zy",
        );

        //Assert - Compare the actual result and expected result
        _verifyValue.fold(
          (fail) => expect(_testValue, fail),
          (succes) => expect(_testValue, succes),
        );
      },
    );
    test(
      'the getWalletValidateAddress function of WalletValidateAddressImpl should return a Map<String, dynamic> response which be a a ("message":"error")',
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
              "method": "Filecoin.WalletValidateAddress",
              "params": [""],
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
        final _verifyValue =
            await _walletValidateAddressImpl.getWalletValidateAddress(
          walletAddress: "",
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
