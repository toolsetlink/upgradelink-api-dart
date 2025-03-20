import 'package:test/test.dart';
import 'package:upgradelink_api_dart/upgradelink_api_dart.dart';

void main() {
  group('A group of tests', () {
    setUp(() {});

    test('UrlUpgradeRequest Test', () async {
      final client = Client(
        accessKeyId: 'a1',
        accessKeySecret: 'a2',
      );

      final request = UrlUpgradeRequest(
        urlKey: 'SkEgKQ4SyLmzazl3w',
        versionCode: 1,
        appointVersionCode: 0,
        devModelKey: 'your_dev_model_key',
        devKey: 'your_dev_key',
      );

      final response = await client.getUrlUpgrade(request);
      print(response.toString());
    });
  });
}
