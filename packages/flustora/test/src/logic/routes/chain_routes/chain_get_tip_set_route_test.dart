import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/chain/chain_get_tip_set_controller.dart';
import 'package:flustora/src/logic/routes/chain_route.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late ChainGetTipSetController _chainGetTipSetController;

  setUp(() {
    _chainGetTipSetController = insert.sl<ChainGetTipSetController>();
  });
  setUp(() {});

  group('ChainGetTipSetRoute =>', () {
    // write tests
    test(
      'the getChainGetTipSet function of ChainGetTipSetRoute should return good response or Error which is a Map<String,dynamic> Type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue =
            await _chainGetTipSetController.getChainGetTipSet(tipSetKey: [
          {
            "/":
                "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi",
          }
        ]);

        //Act - Call the function that is to be tested

        final verifyValue = await Chain.getChainGetTipSet(tipSetKey: [
          {
            "/":
                "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi",
          }
        ]);

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );

    test(
      'the getChainGetTipSet function of ChainGetTipSetRoute should return another Error which is a Map<String,dynamic> Type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue =
            await _chainGetTipSetController.getChainGetTipSet(tipSetKey: [{}]);

        //Act - Call the function that is to be tested

        final verifyValue = await Chain.getChainGetTipSet(tipSetKey: [{}]);

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );
  });
}
