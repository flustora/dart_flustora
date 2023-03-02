/// Project :  Flustora 's Package
/// Description : Ce fichier contiendra toutes les instances qui seront appelés dans tout le programme
/// Author : James Brel
/// onCreated : 30/12/2022
/// onUpdted : #
/// Updted by : #
import 'package:get_it/get_it.dart';

import 'abstract/chain/chain_get_block_abst.dart';
import 'abstract/chain/chain_get_block_message_abst.dart';
import 'abstract/chain/chain_get_genesis_abst.dart';
import 'abstract/chain/chain_get_message_abst.dart';
import 'abstract/chain/chain_get_messages_in_tipset_abst.dart';
import 'abstract/chain/chain_get_parent_messages_abst.dart';
import 'abstract/chain/chain_get_parent_receipts_abst.dart';
import 'abstract/chain/chain_get_tip_set_abst.dart';
import 'abstract/chain/chain_get_tip_set_after_height_abst.dart';
import 'abstract/chain/chain_get_tip_set_by_height_abst.dart';
import 'abstract/chain/chain_has_obj_abst.dart';
import 'abstract/chain/chain_head_abst.dart';
import 'abstract/chain/chain_read_obj_abst.dart';
import 'abstract/chain/chain_tip_set_weight_abst.dart';
import 'abstract/eth/eth_accounts_abst.dart';
import 'abstract/eth/eth_block_number_abst.dart';
import 'abstract/eth/eth_chain_id_abst.dart';
import 'abstract/eth/eth_gas_price_abst.dart';
import 'abstract/eth/eth_get_balance_abst.dart';
import 'abstract/eth/eth_get_block_by_hash_abst.dart';
import 'abstract/eth/eth_get_block_by_number_abst.dart';
import 'abstract/eth/eth_get_block_transaction_count_by_hash_abst.dart';
import 'abstract/wallet/wallet_balance_abst.dart';
import 'abstract/wallet/wallet_validate_address_abst.dart';
import 'abstract/wallet/wallet_verify_abst.dart';
import 'data/services/chain/chain_get_block_impl.dart';
import 'data/services/chain/chain_get_block_message_impl.dart';
import 'data/services/chain/chain_get_genesis_impl.dart';
import 'data/services/chain/chain_get_message_impl.dart';
import 'data/services/chain/chain_get_messages_in_tipset_impl.dart';
import 'data/services/chain/chain_get_parent_messages_impl.dart';
import 'data/services/chain/chain_get_parent_receipts_impl.dart';
import 'data/services/chain/chain_get_tip_set_after_height_impl.dart';
import 'data/services/chain/chain_get_tip_set_by_height_impl.dart';
import 'data/services/chain/chain_get_tip_set_impl.dart';
import 'data/services/chain/chain_has_obj_impl.dart';
import 'data/services/chain/chain_head_impl.dart';
import 'data/services/chain/chain_read_obj_impl.dart';
import 'data/services/chain/chain_tip_set_weight_impl.dart';
import 'data/services/eth/eth_accounts_impl.dart';
import 'data/services/eth/eth_block_number_impl.dart';
import 'data/services/eth/eth_chain_id_impl.dart';
import 'data/services/eth/eth_gas_price_impl.dart';
import 'data/services/eth/eth_get_balance_impl.dart';
import 'data/services/eth/eth_get_block_by_hash_impl.dart';
import 'data/services/eth/eth_get_block_by_number_impl.dart';
import 'data/services/eth/eth_get_block_transaction_count_by_hash_impl.dart';
import 'data/services/wallet/wallet_balance_impl.dart';
import 'data/services/wallet/wallet_validate_address_impl.dart';
import 'data/services/wallet/wallet_verify_impl.dart';
import 'logic/controllers/chain/chain_get_block_controller.dart';
import 'logic/controllers/chain/chain_get_block_message_controller.dart';
import 'logic/controllers/chain/chain_get_genesis_controller.dart';
import 'logic/controllers/chain/chain_get_message_controller.dart';
import 'logic/controllers/chain/chain_get_messages_in_tipset_controller.dart';
import 'logic/controllers/chain/chain_get_parent_messages_controller.dart';
import 'logic/controllers/chain/chain_get_parent_receipts_controller.dart';
import 'logic/controllers/chain/chain_get_tip_set_after_height_controller.dart';
import 'logic/controllers/chain/chain_get_tip_set_by_height_controller.dart';
import 'logic/controllers/chain/chain_get_tip_set_controller.dart';
import 'logic/controllers/chain/chain_has_obj_controller.dart';
import 'logic/controllers/chain/chain_head_controller.dart';
import 'logic/controllers/chain/chain_read_obj_controller.dart';
import 'logic/controllers/chain/chain_tip_set_weight_controller.dart';
import 'logic/controllers/eth/eth_accounts_controller.dart';
import 'logic/controllers/eth/eth_block_number_controller.dart';
import 'logic/controllers/eth/eth_chain_id_controller.dart';
import 'logic/controllers/eth/eth_gas_price_controller.dart';
import 'logic/controllers/eth/eth_get_balance_controller.dart';
import 'logic/controllers/eth/eth_get_block_by_hash_controller.dart';
import 'logic/controllers/eth/eth_get_block_by_number_controller.dart';
import 'logic/controllers/eth/eth_get_block_transaction_count_by_hash_controller.dart';
import 'logic/controllers/wallet/wallet_balance_controller.dart';
import 'logic/controllers/wallet/wallet_validate_address_controller.dart';
import 'logic/controllers/wallet/wallet_verify_controller.dart';

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
  sl.registerLazySingleton<ChainGetMessageAbst>(() => ChainGetMessageImpl());
  sl.registerLazySingleton<ChainGetMessagesInTipsetAbst>(
      () => ChainGetMessagesInTipsetImpl());
  sl.registerLazySingleton<ChainGetParentMessagesAbst>(
      () => ChainGetParentMessagesImpl());
  sl.registerLazySingleton<ChainGetParentReceiptsAbst>(
      () => ChainGetParentReceiptsImpl());
  sl.registerLazySingleton<ChainTipSetWeightAbst>(
      () => ChainTipSetWeightImpl());
  //**********************************************
  sl.registerLazySingleton<EthAccountsAbst>(() => EthAccountsImpl());
  sl.registerLazySingleton<EthBlockNumberAbst>(() => EthBlockNumberImpl());
  sl.registerLazySingleton<EthChainIdAbst>(() => EthChainIdImpl());
  sl.registerLazySingleton<EthGasPriceAbst>(() => EthGasPriceImpl());
  sl.registerLazySingleton<EthGetBalanceAbst>(() => EthGetBalanceImpl());
  sl.registerLazySingleton<EthGetBlockByHashAbst>(
      () => EthGetBlockByHashImpl());
  sl.registerLazySingleton<EthGetBlockByNumberAbst>(
      () => EthGetBlockByNumberImpl());
  sl.registerLazySingleton<EthGetBlockTransactionCountByHashAbst>(
      () => EthGetBlockTransactionCountByHashImpl());
//**********************************************
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
  sl.registerFactory<ChainGetMessageController>(
      () => ChainGetMessageController(chainGetMessageAbst: sl.call()));
  sl.registerFactory<ChainGetMessagesInTipsetController>(() =>
      ChainGetMessagesInTipsetController(
          chainGetMessagesInTipsetAbst: sl.call()));
  sl.registerFactory<ChainGetParentMessagesController>(() =>
      ChainGetParentMessagesController(chainGetParentMessagesAbst: sl.call()));
  sl.registerFactory<ChainGetParentReceiptsController>(() =>
      ChainGetParentReceiptsController(chainGetParentReceiptsAbst: sl.call()));
  sl.registerFactory<ChainTipSetWeightController>(
      () => ChainTipSetWeightController(chainTipSetWeightAbst: sl.call()));
//**********************************************
  sl.registerFactory<EthAccountsController>(
      () => EthAccountsController(ethAccountsAbst: sl.call()));
  sl.registerFactory<EthBlockNumberController>(
      () => EthBlockNumberController(ethBlockNumberAbst: sl.call()));
  sl.registerFactory<EthChainIdController>(
      () => EthChainIdController(ethChainIdAbst: sl.call()));
  sl.registerFactory<EthGasPriceController>(
      () => EthGasPriceController(ethGasPriceAbst: sl.call()));
  sl.registerFactory<EthGetBalanceController>(
      () => EthGetBalanceController(ethGetBalanceAbst: sl.call()));
  sl.registerFactory<EthGetBlockByHashController>(
      () => EthGetBlockByHashController(ethGetBlockByHashAbst: sl.call()));
  sl.registerFactory<EthGetBlockByNumberController>(
      () => EthGetBlockByNumberController(ethGetBlockByNumberAbst: sl.call()));
  sl.registerFactory<EthGetBlockTransactionCountByHashController>(() =>
      EthGetBlockTransactionCountByHashController(
          ethGetBlockTransactionCountByHashAbst: sl.call()));
  //**********************************************
}
