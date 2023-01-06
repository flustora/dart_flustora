import 'package:flustora/flustora.dart';
import 'package:flustora/src/injection.dart' as insert;
import 'package:flustora/src/logic/controllers/chain/chain_get_parent_receipts_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await insert.initialization();
  late ChainGetParentReceiptsController _chainGetParentReceiptsController;

  setUp(() {
    _chainGetParentReceiptsController =
        insert.sl<ChainGetParentReceiptsController>();
  });

  group('ChainGetParentReceiptsRoute =>', () {
    // write tests

    test(
      'the getChainGetParentReceipts function should return good response or Error ("message:"you are offline) which is a Map<String,dynamic> Type',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _chainGetParentReceiptsController
            .getChainGetParentReceipts(cid: {
          "/": "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
        });

        //Act - Call the function that is to be tested

        final verifyValue = await Chain.getChainGetParentReceipts(cid: {
          "/": "bafy2bzacech7iq67p3twanzjl5e2qvojzss4btigfkuzocwnqy5oyygifsy6e"
        });

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );

    test(
      'the getChainGetParentMessages function should return another Error which is a Map<String,dynamic> Type ("message:"another error)',
      () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        final testValue = await _chainGetParentReceiptsController
            .getChainGetParentReceipts(cid: {});

        //Act - Call the function that is to be tested

        final verifyValue = await Chain.getChainGetParentReceipts(cid: {});

        //Assert - Compare the actual result and expected result
        expect(testValue, verifyValue);
      },
    );
  });
}
