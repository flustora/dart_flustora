/// Project :  Flustora 's Package
/// Description : Ce fichier contiendra toutes les instances qui seront appelés dans tout le programme
/// Author : James Brel
/// onCreated : 30/12/2022
/// onUpdted : #
/// Updted by : #
import 'package:flustora/src/abstract/chain/chain_get_block_abst.dart';
import 'package:flustora/src/abstract/chain/chain_get_block_message_abst.dart';
import 'package:flustora/src/abstract/chain/chain_get_genesis_abst.dart';
import 'package:flustora/src/abstract/chain/chain_get_tip_set_abst.dart';
import 'package:flustora/src/abstract/chain/chain_get_tip_set_after_height_abst.dart';
import 'package:flustora/src/abstract/chain/chain_get_tip_set_by_height_abst.dart';
import 'package:flustora/src/abstract/chain/chain_has_obj_abst.dart';
import 'package:flustora/src/abstract/chain/chain_head_abst.dart';
import 'package:flustora/src/abstract/chain/chain_read_obj_abst.dart';
import 'package:flustora/src/abstract/wallet/wallet_balance_abst.dart';
import 'package:flustora/src/abstract/wallet/wallet_validate_address_abst.dart';
import 'package:flustora/src/abstract/wallet/wallet_verify_abst.dart';
import 'package:flustora/src/data/services/chain/chain_get_block_impl.dart';
import 'package:flustora/src/data/services/chain/chain_get_block_message_impl.dart';
import 'package:flustora/src/data/services/chain/chain_get_genesis_impl.dart';
import 'package:flustora/src/data/services/chain/chain_get_tip_set_after_height_impl.dart';
import 'package:flustora/src/data/services/chain/chain_get_tip_set_by_height_impl.dart';
import 'package:flustora/src/data/services/chain/chain_get_tip_set_impl.dart';
import 'package:flustora/src/data/services/chain/chain_has_obj_impl.dart';
import 'package:flustora/src/data/services/chain/chain_head_impl.dart';
import 'package:flustora/src/data/services/chain/chain_read_obj_impl.dart';
import 'package:flustora/src/data/services/wallet/wallet_balance_impl.dart';
import 'package:flustora/src/data/services/wallet/wallet_validate_address_impl.dart';
import 'package:flustora/src/data/services/wallet/wallet_verify_impl.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_block_controller.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_block_message_controller.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_genesis_controller.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_tip_set_after_height_controller.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_tip_set_by_height_controller.dart';
import 'package:flustora/src/logic/controllers/chain/chain_get_tip_set_controller.dart';
import 'package:flustora/src/logic/controllers/chain/chain_has_obj_controller.dart';
import 'package:flustora/src/logic/controllers/chain/chain_head_controller.dart';
import 'package:flustora/src/logic/controllers/chain/chain_read_obj_controller.dart';
import 'package:flustora/src/logic/controllers/wallet/wallet_balance_controller.dart';
import 'package:flustora/src/logic/controllers/wallet/wallet_validate_address_controller.dart';
import 'package:flustora/src/logic/controllers/wallet/wallet_verify_controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initialization() async {
  sl.registerLazySingleton<WalletBalanceAbst>(() => WalletBalanceImpl());
  sl.registerLazySingleton<WalletValidateAddressAbst>(
      () => WalletValidateAddressImpl());
  sl.registerLazySingleton<WalletVerifyAbst>(() => WalletVerifyImpl());

  sl.registerFactory<WalletBalanceController>(
      () => WalletBalanceController(walletBalanceAbst: sl.call()));
  sl.registerFactory<WalletValidateAddressController>(() =>
      WalletValidateAddressController(walletValidateAddressAbst: sl.call()));
  sl.registerFactory<WalletVerifyController>(
      () => WalletVerifyController(walletVerifyAbst: sl.call()));

  sl.registerLazySingleton<ChainHeadAbst>(() => ChainHeadImpl());
  sl.registerLazySingleton<ChainGetGenesisAbst>(() => ChainGetGenesisImpl());
  sl.registerLazySingleton<ChainGetTipSetByHeightAbst>(
      () => ChainGetTipSetByHeightImpl());
  sl.registerLazySingleton<ChainGetTipSetAfterHeightAbst>(
      () => ChainGetTipSetAfterHeightImpl());
  sl.registerLazySingleton<ChainGetTipSetAbst>(() => ChainGetTipSetImpl());
  sl.registerLazySingleton<ChainHasObjAbst>(() => ChainHasObjImpl());
  sl.registerLazySingleton<ChainReadObjAbst>(() => ChainReadObjImpl());
  sl.registerLazySingleton<ChainGetBlockAbst>(() => ChainGetBlockImpl());
  sl.registerLazySingleton<ChainGetBlockMessageAbst>(
      () => ChainGetBlockMessageImpl());

  sl.registerFactory<ChainHeadController>(
      () => ChainHeadController(chainHeadAbst: sl.call()));
  sl.registerFactory<ChainGetGenesisController>(
      () => ChainGetGenesisController(chainGetGenesisAbst: sl.call()));
  sl.registerFactory<ChainGetTipSetByHeightController>(() =>
      ChainGetTipSetByHeightController(chainGetTipSetByHeightAbst: sl.call()));
  sl.registerFactory<ChainGetTipSetAfterHeightController>(() =>
      ChainGetTipSetAfterHeightController(
          chainGetTipSetAfterHeightAbst: sl.call()));
  sl.registerFactory<ChainGetTipSetController>(
      () => ChainGetTipSetController(chainGetTipSetAbst: sl.call()));
  sl.registerFactory<ChainHasObjController>(
      () => ChainHasObjController(chainHasObjAbst: sl.call()));
  sl.registerFactory<ChainReadObjController>(
      () => ChainReadObjController(chainReadObjAbst: sl.call()));
  sl.registerFactory<ChainGetBlockController>(
      () => ChainGetBlockController(chainGetBlockAbst: sl.call()));
  sl.registerFactory<ChainGetBlockMessageController>(() =>
      ChainGetBlockMessageController(chainGetBlockMessageAbst: sl.call()));
}
