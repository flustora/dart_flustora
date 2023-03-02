import 'package:dartz/dartz.dart';

import '../../../abstract/chain/chain_head_abst.dart';

class ChainHeadController {
  final ChainHeadAbst chainHeadAbst;

  ChainHeadController({
    required this.chainHeadAbst,
  });

  Future<Map<String, dynamic>> getChainHead() async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await chainHeadAbst.getChainHead();
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );

    return res;
  }
}
