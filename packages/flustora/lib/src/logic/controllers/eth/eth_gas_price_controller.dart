import 'package:dartz/dartz.dart';

import '../../../abstract/eth/eth_gas_price_abst.dart';

class EthGasPriceController {
  final EthGasPriceAbst ethGasPriceAbst;

  EthGasPriceController({
    required this.ethGasPriceAbst,
  });
  Future<Map<String, dynamic>> getEthGasPrice() async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await ethGasPriceAbst.getEthGasPrice();
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );
    return res;
  }
}
