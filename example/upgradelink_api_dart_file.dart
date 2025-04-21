import 'package:upgradelink_api_dart/upgradelink_api_dart.dart';

Future<void> main() async {
  final client = Client(
    accessKey: 'mui2W50H1j-OC4xD6PgQag',
    secretKey: 'PEbdHFGC0uO_Pch7XWBQTMsFRxKPQAM2565eP8LJ3gc',
    // protocol: 'HTTP',
    // endpoint: 'api.upgrade.toolsetlink.com',
  );

  final request = FileUpgradeRequest(
    fileKey: 'LOYlLXNy7wV3ySuh0XgtSg',
    versionCode: 1,
    appointVersionCode: 0,
    devModelKey: '',
    devKey: '',
  );

  final response = await client.getFileUpgrade(request);
  print(response.toString());
}
