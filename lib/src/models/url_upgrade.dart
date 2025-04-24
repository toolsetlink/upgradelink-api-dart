class UrlUpgradeRequest {
  final String urlKey;
  final int versionCode;
  final int appointVersionCode;
  final String devModelKey;
  final String devKey;

  UrlUpgradeRequest({
    required this.urlKey,
    required this.versionCode,
    required this.appointVersionCode,
    required this.devModelKey,
    required this.devKey,
  });

  Map<String, dynamic> toJson() {
    return {
      'urlKey': urlKey,
      'versionCode': versionCode,
      'appointVersionCode': appointVersionCode,
      'devModelKey': devModelKey,
      'devKey': devKey,
    };
  }
}

class UrlUpgradeDataResponse {
  final String urlKey;
  final String versionName;
  final int versionCode;
  final String urlPath;
  final int upgradeType;
  final String promptUpgradeContent;

  UrlUpgradeDataResponse({
    required this.urlKey,
    required this.versionName,
    required this.versionCode,
    required this.urlPath,
    required this.upgradeType,
    required this.promptUpgradeContent,
  });

  factory UrlUpgradeDataResponse.fromJson(Map<String, dynamic> json) {
    return UrlUpgradeDataResponse(
      urlKey: json['urlKey'] as String,
      versionName: json['versionName'] as String,
      versionCode: json['versionCode'] as int,
      urlPath: json['urlPath'] as String,
      upgradeType: json['upgradeType'] as int,
      promptUpgradeContent: json['promptUpgradeContent'] as String,
    );
  }

  @override
  String toString() {
    return 'UrlUpgradeDataResponse{'
        'urlKey: $urlKey, '
        'versionName: $versionName, '
        'versionCode: $versionCode, '
        'urlPath: $urlPath, '
        'upgradeType: $upgradeType, '
        'promptUpgradeContent: $promptUpgradeContent'
        '}';
  }
}

class UrlUpgradeResponse {
  final int code;
  final String msg;
  final UrlUpgradeDataResponse? data;

  UrlUpgradeResponse({
    required this.code,
    required this.msg,
    this.data,
  });

  factory UrlUpgradeResponse.fromJson(Map<String, dynamic> json) {
    return UrlUpgradeResponse(
      code: json['code'] as int,
      msg: json['msg'] as String,
      data: json['data'] != null
          ? UrlUpgradeDataResponse.fromJson(
              json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  String toString() {
    return 'UrlUpgradeResponse{'
        'code: $code, '
        'msg: $msg, '
        'data: ${data != null ? data.toString() : "null"}'
        '}';
  }
}
