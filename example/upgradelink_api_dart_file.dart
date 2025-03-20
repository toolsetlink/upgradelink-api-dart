import 'package:upgradelink_api_dart/upgradelink_api_dart.dart';

Future<void> main() async {
  final client = Client(
    accessKeyId: 'a1123',
    accessKeySecret: 'a2123',
  );

  final request = FileUpgradeRequest(
    fileKey: 'LOYlLXNy7wV3y',
    versionCode: 1,
    appointVersionCode: 0,
    devModelKey: 'your_dev_model_key',
    devKey: 'your_dev_key',
  );

  final response = await client.getFileUpgrade(request);
  print(response.data.toString());
}
