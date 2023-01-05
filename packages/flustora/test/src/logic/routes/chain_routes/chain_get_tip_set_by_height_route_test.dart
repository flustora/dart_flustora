import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/chain/chain_get_tip_set_by_height_controller.dart';
import 'package:flustora/src/logic/routes/chain_route.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late ChainGetTipSetByHeightController _chainGetTipSetByHeightController;

  setUp(() {
    _chainGetTipSetByHeightController =
        insert.sl<ChainGetTipSetByHeightController>();
  });

  group('chainGetTipSetByHeightRoute =>', () {
    // write tests

    test(
        'the getChainGetTipSetByHeight function of chainGetTipSetByHeightRoute should return good response or Error which is a Map<String,dynamic> Type',
        () async {
      //Arrange - Setup facts, Put Expected outputs or Initilize
      final testValue =
          await _chainGetTipSetByHeightController.getChainGetTipSetByHeight(
        height: 2479232,
      );

      //Act - Call the function that is to be tested

      final verifyValue =
          await Chain.getChainGetTipSetByHeight(height: 2479232);

      //Assert - Compare the actual result and expected result
      expect(testValue, verifyValue);
    });
  });
}
