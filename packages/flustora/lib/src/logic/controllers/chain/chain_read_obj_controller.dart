import 'package:dartz/dartz.dart';
import 'package:flustora/src/abstract/chain/chain_read_obj_abst.dart';

class ChainReadObjController {
  final ChainReadObjAbst chainReadObjAbst;

  ChainReadObjController({
    required this.chainReadObjAbst,
  });

  Future<Map<String, dynamic>> getChainReadObj({
    required Map<String, String> cid,
  }) async {
    late Map<String, dynamic> res;
    Either<Map<String, dynamic>, Map<String, dynamic>> result;
    result = await chainReadObjAbst.getChainReadObj(cid: cid);
    result.fold(
      (fail) => res = fail,
      (succes) => res = succes,
    );

    return res;
  }
}
