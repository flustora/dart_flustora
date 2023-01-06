import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/chain/chain_tip_set_weight_controller.dart';
import 'package:flustora/src/logic/routes/chain_route.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late ChainTipSetWeightController _chainTipSetWeightController;

  setUp(() {
    _chainTipSetWeightController = insert.sl<ChainTipSetWeightController>();
  });

  group('ChainTipSetWeightRoute =>', () {
    // write tests
    test(
      'the getChainTipSetWeight function of ChainTipSetWeightRoute should return good response or Error which is a Map<String,dynamic> Type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue =
            await _chainTipSetWeightController.getChainTipSetWeight(tipSetKey: [
          {
            "/":
                "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e",
          }
        ]);

        //Act - Call the function that is to be tested

        final verifyValue = await Chain.getChainTipSetWeight(tipSetKey: [
          {
            "/":
                "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e",
          }
        ]);

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );

    test(
      'the getChainTipSetWeight function of ChainTipSetWeightRoute should return another Error which is a Map<String,dynamic> Type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _chainTipSetWeightController
            .getChainTipSetWeight(tipSetKey: [{}]);

        //Act - Call the function that is to be tested

        final verifyValue = await Chain.getChainTipSetWeight(tipSetKey: [{}]);

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );
  });
}
