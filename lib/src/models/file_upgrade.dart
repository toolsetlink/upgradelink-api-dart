class FileUpgradeRequest {
  final String fileKey;
  final int versionCode;
  final int appointVersionCode;
  final String devModelKey;
  final String devKey;

  FileUpgradeRequest({
    required this.fileKey,
    required this.versionCode,
    required this.appointVersionCode,
    required this.devModelKey,
    required this.devKey,
  });

  Map<String, dynamic> toJson() {
    return {
      'fileKey': fileKey,
      'versionCode': versionCode,
      'appointVersionCode': appointVersionCode,
      'devModelKey': devModelKey,
      'devKey': devKey,
    };
  }
}

class FileUpgradeResponse {
  final int code;
  final String msg;
  final FileUpgradeDataResponse? data;

  FileUpgradeResponse({
    required this.code,
    required this.msg,
    this.data,
  });

  factory FileUpgradeResponse.fromJson(Map<String, dynamic> json) {
    return FileUpgradeResponse(
      code: json['code'] as int,
      msg: json['msg'] as String,
      data: json['data'] != null
          ? FileUpgradeDataResponse.fromJson(
              json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  String toString() {
    return 'FileUpgradeResponse{'
        'code: $code, '
        'msg: $msg, '
        'data: ${data != null ? data.toString() : "null"}'
        '}';
  }
}

class FileUpgradeDataResponse {
  final String fileKey;
  final String versionName;
  final int versionCode;
  final String urlPath;
  final int upgradeType;
  final String promptUpgradeContent;

  FileUpgradeDataResponse({
    required this.fileKey,
    required this.versionName,
    required this.versionCode,
    required this.urlPath,
    required this.upgradeType,
    required this.promptUpgradeContent,
  });

  factory FileUpgradeDataResponse.fromJson(Map<String, dynamic> json) {
    return FileUpgradeDataResponse(
      fileKey: json['fileKey'] as String,
      versionName: json['versionName'] as String,
      versionCode: json['versionCode'] as int,
      urlPath: json['urlPath'] as String,
      upgradeType: json['upgradeType'] as int,
      promptUpgradeContent: json['promptUpgradeContent'] as String,
    );
  }

  @override
  String toString() {
    return 'FileUpgradeDataResponse{'
        'fileKey: $fileKey, '
        'versionName: $versionName, '
        'versionCode: $versionCode, '
        'urlPath: $urlPath, '
        'upgradeType: $upgradeType, '
        'promptUpgradeContent: $promptUpgradeContent'
        '}';
  }
}
