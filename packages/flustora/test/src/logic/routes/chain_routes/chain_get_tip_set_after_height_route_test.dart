import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/chain/chain_get_tip_set_after_height_controller.dart';
import 'package:flustora/src/logic/routes/chain_route.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late ChainGetTipSetAfterHeightController _chainGetTipSetAfterHeightController;

  setUp(() {
    _chainGetTipSetAfterHeightController =
        insert.sl<ChainGetTipSetAfterHeightController>();
  });

  group('chainGetTipSetByHeightRoute', () {
    // write tests
    test(
      "the getChainGetTipSetAfterHeight function of chainGetTipSetByHeightRoute should return a good response or bad response ('message': good response') or ('message': you are offline')",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _chainGetTipSetAfterHeightController
            .getChainGetTipSetAfterHeight(
          cid: [
            {
              "/":
                  "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
            }
          ],
          height: 2479232,
        );
        //Act - Call the function that is to be tested
        final verifyValue = await Chain.getChainGetTipSetAfterHeight(
          cid: [
            {
              "/":
                  "bafy2bzaceahirpzohp3nj7kl6cpktigcncewjrrvbrzn5wadvxbk6bnzsvxqi"
            }
          ],
          height: 2479232,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );

    test(
      "the getChainGetTipSetAfterHeight function of chainGetTipSetByHeightRoute should return a bad response ('message':another error')",
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _chainGetTipSetAfterHeightController
            .getChainGetTipSetAfterHeight(
          cid: [{}],
          height: 2306530,
        );
        //Act - Call the function that is to be tested
        final verifyValue = await Chain.getChainGetTipSetAfterHeight(
          cid: [{}],
          height: 2306530,
        );

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );
  });
}
