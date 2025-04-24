import 'package:upgradelink_api_dart/src/models/config.dart';
import 'package:upgradelink_api_dart/src/models/url_upgrade.dart';
import 'package:upgradelink_api_dart/upgradelink_api_dart.dart';

Future<void> main() async {
  final config = Config(
    accessKey: 'mui2W50H1j-OC4xD6PgQag',
    secretKey: 'PEbdHFGC0uO_Pch7XWBQTMsFRxKPQAM2565eP8LJ3gc',
    // protocol: 'HTTP',
    // endpoint: 'api.upgrade.toolsetlink.com',
  );
  final client = Client(config: config);

  final request = UrlUpgradeRequest(
    urlKey: 'uJ47NPeT7qjLa1gL3sVHqw',
    versionCode: 1,
    appointVersionCode: 0,
    devModelKey: '',
    devKey: '',
  );

  final response = await client.getUrlUpgrade(request);
  print(response.toString());
}
