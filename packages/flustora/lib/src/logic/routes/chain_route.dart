import 'package:flustora/src/injection.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_block_controller.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_block_message_controller.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_genesis_controller.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_tip_set_after_height_controller.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_tip_set_by_height_controller.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_tip_set_controller.dart';
import 'package:flustora/src/logic/controllers/chain/chain_has_obj_controller.dart';
import 'package:flustora/src/logic/controllers/chain/chain_head_controller.dart';
import 'package:flustora/src/logic/controllers/chain/chain_read_obj_controller.dart';

class Chain {
  static Future<Map<String, dynamic>> getChainHead() async =>
      await sl<ChainHeadController>().getChainHead();

  static Future<Map<String, dynamic>> getChainGetGenesis() async =>
      await sl<ChainGetGenesisController>().getChainGetGenesis();

  static Future<Map<String, dynamic>> getChainGetTipSetByHeight({
    required int height,
  }) async =>
      await sl<ChainGetTipSetByHeightController>().getChainGetTipSetByHeight(
        height: height,
      );

  static Future<Map<String, dynamic>> getChainGetTipSetAfterHeight({
    required List<Map<String, String>> cid,
    required int height,
  }) async =>
      await sl<ChainGetTipSetAfterHeightController>()
          .getChainGetTipSetAfterHeight(cid: cid, height: height);

  static Future<Map<String, dynamic>> getChainGetTipSet({
    required List<Map<String, String>> tipSetKey,
  }) async =>
      await sl<ChainGetTipSetController>().getChainGetTipSet(
        tipSetKey: tipSetKey,
      );
  static Future<Map<String, dynamic>> getChainHasObj({
    required Map<String, String> cid,
  }) async =>
      await sl<ChainHasObjController>().getChainHasObj(
        cid: cid,
      );
  static Future<Map<String, dynamic>> getChainReadObj({
    required Map<String, String> cid,
  }) async =>
      await sl<ChainReadObjController>().getChainReadObj(
        cid: cid,
      );

  static Future<Map<String, dynamic>> getChainGetBlock({
    required Map<String, String> cid,
  }) async =>
      await sl<ChainGetBlockController>().getChainGetBlock(
        cid: cid,
      );

  static Future<Map<String, dynamic>> getChainGetBlockMessage({
    required Map<String, String> cid,
  }) async =>
      await sl<ChainGetBlockMessageController>().getChainGetBlockMessage(
        cid: cid,
      );
}
