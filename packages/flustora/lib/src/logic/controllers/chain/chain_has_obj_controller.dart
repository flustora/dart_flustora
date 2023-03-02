import 'package:dartz/dartz.dart';

import '../../../abstract/chain/chain_has_obj_abst.dart';

class ChainHasObjController {
  final ChainHasObjAbst chainHasObjAbst;

  ChainHasObjController({
    required this.chainHasObjAbst,
  });

  Future<Map<String, dynamic>> getChainHasObj({
    required Map<String, String> cid,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await chainHasObjAbst.getChainHasObj(
      cid: cid,
    );
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );

    return res;
  }
}
