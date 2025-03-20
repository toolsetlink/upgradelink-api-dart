import 'package:upgradelink_api_dart/upgradelink_api_dart.dart';

Future<void> main() async {
  final client = Client(
    accessKeyId: 'a112312',
    accessKeySecret: 'a2123123',
  );

  final request = UrlUpgradeRequest(
    urlKey: 'SkEgKQ4SyLmzw',
    versionCode: 1,
    appointVersionCode: 0,
    devModelKey: 'your_dev_model_key',
    devKey: 'your_dev_key',
  );

  final response = await client.getUrlUpgrade(request);
  print(response.toString());
}
